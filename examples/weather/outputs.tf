output "user" {
  value       = data.shell_script.user.output["user"]
  description = "User details"
}

output "data_weather" {
  value       = data.shell_script.weather.output["SanFrancisco"]
  description = "weather data details"
}

output "weather" {
  value       = shell_script.weather.output["London"]
  description = "weather details"
}
