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
			"resource_group_name": "tfmodulevalidation-test-group",
			"appName":             "aagcdn",
			"environment":         "test",
		},
	}
	defer terraform.Destroy(t, terraformOptions)

	// Act
	terraform.InitAndApply(t, terraformOptions)

	// Assert
	assert := assert.New(t)

	profileID := terraform.Output(t, terraformOptions, "profile_id")
	assert.NotNil(profileID)
	assert.Contains(profileID, "aagcdn")

	endpointID := terraform.Output(t, terraformOptions, "endpoint_id")
	assert.NotNil(endpointID)
	assert.Contains(endpointID, "aagcdn")

	storagePrincipalID := terraform.Output(t, terraformOptions, "storage_principal_id")
	assert.NotNil(storagePrincipalID)

	storageName := terraform.Output(t, terraformOptions, "storage_name")
	assert.NotNil(storageName)
	assert.Contains(storageName, "aagcdn")
}
