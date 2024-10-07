{{- define "tenant.name" -}}
{{- regexReplaceAll "([^a-zA-Z0-9])+" $.Values.Tenant "-" -}}
{{- end -}}

{{- define "tenant.namespace" -}}
{{- $namespace := printf "%s-%s" .g.Values.Tenant .ns -}}
{{- regexReplaceAll "([^a-zA-Z0-9])+" $namespace "-" -}}
{{- end -}}
