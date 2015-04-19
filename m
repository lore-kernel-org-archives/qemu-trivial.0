Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yjmr9-0001DA-8u
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 06:53:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr6-00019A-OO
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr5-0005qO-9T
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:40 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1Yjmr5-0005pU-1l
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 06:53:39 -0400
Received: by wizk4 with SMTP id k4so67480966wiz.1
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 03:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h67faqBl7jtGa0cuxUhkYbfCpSfY7VRaT6fPCxqoQok=;
	b=GtK/e+2jK2XvnYl+oxPL6LX7KsP5MYdZxe7lOAFbtdjbmmGgopYeHIEubwzrx0mzAF
	TorN5BUNrP99sIZXzNPS3ODV/VWsDrKrd7m8bVQvH6Gk6IJLTbVFzavNzED7Jjj2S17Q
	v0y66u4BEfj1zJJf80unD9ITaC3vPmInTu/ER9TerdmOcUMLgt7TiQTvy0pku82hJFZ6
	D8+R/J4wZ6LZQv/weOL77wlZX5Xn4YrAOploPM90dIuQmgY1LPGbS8U8jERZ1AXpjlcB
	8UeaVerRUeok3hEM5TFMDwcBY8m6hzRrrAVQ4xDMmfjfnkMmAFV19UmDXn//9+XHF6Tg
	K6qQ==
X-Gm-Message-State: ALoCoQlGWL5+sqMqzo4IlQneU1EDQRu0lsB2CkNjVvmN4jpe9/QMF5sptyC5+9Nekpl+JVNXr3D2
X-Received: by 10.194.89.70 with SMTP id bm6mr20591705wjb.146.1429440818530;
	Sun, 19 Apr 2015 03:53:38 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id fv2sm4350546wjb.6.2015.04.19.03.53.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Apr 2015 03:53:37 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 Apr 2015 13:53:17 +0300
Message-Id: <1429440798-11888-5-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH 3/4] qemu-ga: Introduce Windows MSI script
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Apr 2015 10:53:42 -0000

The script enables building Windows MSI installation package on Linux with wixl tool.

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/installer/qemu-ga.wxs | 156 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 qga/installer/qemu-ga.wxs

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
new file mode 100644
index 0000000..4611255
--- /dev/null
+++ b/qga/installer/qemu-ga.wxs
@@ -0,0 +1,156 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<Wix xmlns="http://schemas.microsoft.com/wix/2006/wi">
+  <?ifndef env.QEMU_GA_VERSION ?>
+    <?error Environemtn variable QEMU_GA_VERSION undefined?>
+  <?endif?>
+
+  <?ifndef env.QEMU_GA_DISTRO ?>
+    <?error Environment variable QEMU_GA_DISTRO undefined?>
+  <?endif?>
+
+  <?ifndef env.QEMU_GA_MANUFACTURER ?>
+    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
+  <?endif?>
+    
+  <?ifndef var.Arch?>
+    <?error Define Arch to 32 or 64?>
+  <?endif?>
+
+  <?ifndef var.Mingw_bin?>
+    <?if $(var.Arch) = "64"?>
+      <?define Mingw_bin=/usr/x86_64-w64-mingw32/sys-root/mingw/bin ?>
+    <?endif?>
+    <?if $(var.Arch) = "32"?>
+      <?define Mingw_bin=/usr/i686-w64-mingw32/sys-root/mingw/bin ?>
+    <?endif?>
+  <?endif?>
+
+  <?if $(var.Arch) = "64"?>
+    <?define ArchLib=libgcc_s_seh-1.dll?>
+    <?define GaProgramFilesFolder="ProgramFiles64Folder" ?>
+  <?endif?>
+
+  <?if $(var.Arch) = "32"?>
+    <?define ArchLib=libgcc_s_sjlj-1.dll?>
+    <?define GaProgramFilesFolder="ProgramFilesFolder" ?>
+  <?endif?>
+
+  <?ifndef var.ArchLib ?>
+    <?error Unexpected Arch value $(var.Arch)?>
+  <?endif?>
+
+  <Product
+    Name="QEMU guest agent"
+    Id="*"
+    UpgradeCode="{EB6B8302-C06E-4bec-ADAC-932C68A3A98D}"
+    Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
+    Version="$(env.QEMU_GA_VERSION)"
+    Language="1033">
+    <?if $(var.Arch) = 32 ?>
+    <Condition Message="Error: 32-bit version of Qemu GA can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
+    <?endif?>
+    <Package
+      Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
+      InstallerVersion="200"
+      Languages="1033"
+      Compressed="yes"
+      InstallScope="perMachine"
+      />
+    <Media Id="1" Cabinet="qemu_ga.$(env.QEMU_GA_VERSION).cab" EmbedCab="yes" />
+    <Property Id="WHSLogo">1</Property>
+    <Property Id="PREVIOUSVERSIONSINSTALLED" />
+    <Upgrade Id="{EB6B8302-C06E-4bec-ADAC-932C68A3A98D}">
+      <UpgradeVersion
+          OnlyDetect="no"
+        Minimum="1.0.0.0" Maximum="$(env.QEMU_GA_VERSION)"
+        Property="PREVIOUSVERSIONSINSTALLED"
+        IncludeMinimum="yes" IncludeMaximum="no" />
+      
+      <UpgradeVersion OnlyDetect="yes"
+        Minimum="$(env.QEMU_GA_VERSION)" Maximum="$(env.QEMU_GA_VERSION)"
+        Property="SAMEVERSIONINSTALLED"
+        IncludeMinimum="yes" IncludeMaximum="yes" />
+
+      <UpgradeVersion OnlyDetect="yes"
+        Minimum="$(env.QEMU_GA_VERSION)" Maximum="1000"
+        Property="FUTUREVERSIONSINSTALLED"
+        IncludeMinimum="no" IncludeMaximum="yes" /> 
+    </Upgrade>
+
+    <Directory Id="TARGETDIR" Name="SourceDir">
+      <Directory Id="$(var.GaProgramFilesFolder)" Name="QEMU Guest Agent">
+        <Directory Id="qemu_ga_directory" Name="Qemu-ga">
+          <Component Id="qemu_ga" Guid="{908B7199-DE2A-4dc6-A8D0-27A5AE444FEA}">
+            <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="../../qemu-ga.exe" KeyPath="yes" DiskId="1"/>
+            <?ifdef var.InstallVss ?>
+            <File Id="qga_vss.dll" Name="qga-vss.dll" Source="../vss-win32/qga-vss.dll" KeyPath="no" DiskId="1"/>
+            <File Id="qga_vss.tlb" Name="qga-vss.tlb" Source="../vss-win32/qga-vss.tlb" KeyPath="no" DiskId="1"/>
+            <?endif?>
+            <File Id="iconv.dll" Name="iconv.dll" Source="$(var.Mingw_bin)/iconv.dll" KeyPath="no" DiskId="1"/>
+            <File Id="$(var.ArchLib)" Name="$(var.ArchLib)" Source="$(var.Mingw_bin)/$(var.ArchLib)" KeyPath="no" DiskId="1"/>
+            <File Id="libglib-2.0-0.dll" Name="libglib-2.0-0.dll" Source="$(var.Mingw_bin)/libglib-2.0-0.dll" KeyPath="no" DiskId="1"/>
+            <File Id="libintl-8.dll" Name="libintl-8.dll" Source="$(var.Mingw_bin)/libintl-8.dll" KeyPath="no" DiskId="1"/>
+            <File Id="libssp-0.dll" Name="libssp-0.dll" Source="$(var.Mingw_bin)/libssp-0.dll" KeyPath="no" DiskId="1"/>
+            <File Id="libwinpthread-1.dll" Name="libwinpthread-1.dll" Source="$(var.Mingw_bin)/libwinpthread-1.dll" KeyPath="no" DiskId="1"/>
+            <ServiceInstall
+              Id="ServiceInstaller"
+              Type="ownProcess"
+              Vital="yes"
+              Name="QEMU-GA"
+              DisplayName="QEMU Guest Agent"
+              Description="QEMU Guest Agent"
+              Start="auto"
+              Account="LocalSystem"
+              ErrorControl="ignore"
+              Interactive="no"
+              Arguments="-d"
+              >
+            </ServiceInstall>
+            <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="no" />
+          </Component>
+
+          <Component Id="registry_entries" Guid="d075d109-51ca-11e3-9f8b-000c29858960">
+            <RegistryKey Root="HKLM"
+                         Key="Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
+              <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
+              <RegistryValue Type="string" Name="Version" Value="$(env.QEMU_GA_VERSION)" />
+            </RegistryKey>
+          </Component>
+        </Directory>
+      </Directory>
+    </Directory>
+
+    <Property Id="cmd" Value="cmd.exe"/>
+
+    <?ifdef var.InstallVss ?>
+    <CustomAction Id="RegisterCom"
+             ExeCommand='/c [qemu_ga_directory]qemu-ga.exe" -s vss-install'
+              Execute="deferred"
+              Property="cmd"
+              Impersonate="no"
+              Return="check"
+              >
+    </CustomAction>
+    <CustomAction Id="UnRegisterCom"
+              ExeCommand='/c "[qemu_ga_directory]qemu-ga.exe" -s vss-uninstall'
+              Execute="deferred"
+              Property="cmd"
+              Impersonate="no"
+              Return="check"
+              ></CustomAction>
+    <?endif?>
+
+    <Feature Id="QEMUFeature" Title="QEMU Guest Agent" Level="1">
+      <ComponentRef Id="qemu_ga" />
+      <ComponentRef Id="registry_entries" />
+    </Feature>
+
+    <InstallExecuteSequence>
+      <RemoveExistingProducts Before="InstallInitialize" />
+      <?ifdef var.InstallVss ?>
+      <Custom Action="RegisterCom" After="InstallFiles">&amp;QEMUFeature &lt;&gt; 2 </Custom>
+      <Custom Action="UnRegisterCom" After="StopServices"  Before="RemoveFiles">Installed OR !QEMUFeature = 3</Custom>
+      <?endif?>
+    </InstallExecuteSequence>
+  </Product>
+</Wix>
-- 
2.1.0


