package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCdnModule(t *testing.T) {
	// Arrange
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/.",
		Vars: map[string]interface{}{
			"resource-group-name": "tfmodulevalidation-test-group",
			"appName":             "aagcdn",
			"environment":         "test", 
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	// Act
	terraform.InitAndApply(t, terraformOptions)

	// Assert
	assert := assert.New(t)

	profile_id := terraform.Output(t, terraformOptions, "profile_id")
	assert.NotNil(profile_id)
	assert.Contains("aagcdn", profile_id)

	endpoint_id := terraform.Output(t, terraformOptions, "endpoint_id")
	assert.NotNil(endpoint_id)
	assert.Contains("aagcdn", endpoint_id)

	storage_principal_id := terraform.Output(t, terraformOptions, "storage_principal_id")
	assert.NotNil(storage_principal_id)

	storage_name := terraform.Output(t, terraformOptions, "storage_name")
	assert.NotNil(storage_name)
	assert.Contains("aagcdn", storage_name)
}
