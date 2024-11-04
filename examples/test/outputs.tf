output "commit_id2" {
  value       = shell_script.test5.output["commit_id"]
  description = "commit_id2 details"
}

output "commit_id" {
  value       = data.shell_script.test.output["commit_id"]
  description = "commit_id details"
}
