local test = {}
test.setup = function()
	local status_ok, neotest = pcall(require, "neotest")
	if not status_ok then
		return
	end

	local php_status_ok, php_adapter = pcall(require, "neotest-phpunit")
	if not php_status_ok then
		return
	end

	neotest.setup({
		adapters = {
			php_adapter({
				phpunit_cmd = "test-script.sh"
     --      function()
     --      
					-- return "docker exec -it laradock-workspace-1 vendor/bin/phpunit"
				-- end,
			}),
		},
	})
end

return test
