all: clean dev-setup build-js-production

# Dev env management
dev-setup: clean npm-init

npm-init:
	npm ci

npm-update:
	npm update

# Building
build-js:
	npm run dev

build-js-production:
	npm run build

watch-js:
	npm run watch

# Linting
lint-fix:
	npm run lint:fix

lint-fix-watch:
	npm run lint:fix-watch

# Cleaning
clean:
	rm -rf dist

clean-git: clean
	git checkout -- dist

scss: dist/core-server.css apps/settings/css/settings.scss
	node_modules/node-sass/bin/node-sass apps/settings/css/settings.scss dist/settings-setting-settingss.css

dist/core-%.css: core/css/%.scss
	node_modules/node-sass/bin/node-sass $< $@
