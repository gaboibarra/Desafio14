{{/*
Generate the fullname using the release name and the chart name.
*/}}
{{- define "educacionit-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate a name that can be used for naming resources.
*/}}
{{- define "educacionit-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Generate standard labels that are used for all resources.
*/}}
{{- define "educacionit-app.labels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Generate selector labels.
*/}}
{{- define "educacionit-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "educacionit-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
