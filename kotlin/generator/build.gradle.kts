plugins {
    alias(libs.plugins.kotlin.jvm)
    alias(libs.plugins.kotlin.serialization)
    application
}

application {
    mainClass.set("com.basecamp.fizzy.generator.MainKt")
}

tasks.withType<JavaCompile>().configureEach {
    options.release.set(25)
}

tasks.named<JavaExec>("run") {
    workingDir = rootProject.projectDir
}

dependencies {
    implementation(libs.kotlinx.serialization.json)
}
