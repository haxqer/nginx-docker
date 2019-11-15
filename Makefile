help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  gif                    with ngx_http_empty_gif_module on port: 8081."
	@echo "  gif-tk                 with ngx_http_empty_gif_module and traefik."


gif:
	@./start-empty-gif-nginx-8081.sh

gif-tk:
	@./start-empty-gif-nginx-traefik.sh

