Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozenG-0004xT-D1
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2022 09:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozdli-0003Xt-42
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 08:02:00 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1ozdld-00086u-Bj
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 08:01:52 -0500
Received: from [192.168.16.189] (helo=roughy.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.drobyshev@virtuozzo.com>) id 1ozdlS-00CG4w-4o;
 Mon, 28 Nov 2022 14:01:38 +0100
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
To: qemu-trivial@nongnu.org
Cc: andrey.drobyshev@virtuozzo.com,
	den@virtuozzo.com
Subject: [PATCH] qga-win: replace libpcre with libpcre2 in MSI package
Date: Mon, 28 Nov 2022 15:02:21 +0200
Message-Id: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.drobyshev@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Nov 2022 09:07:13 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2022 13:02:04 -0000

According to GLib changelog [1], since version 2.73.2 GLib is using
libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
fails due to missing DLL.

This commit makes wixl to put libpcre2-8-0.dll into the MSI bundle.

[1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2

Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
---
 qga/installer/qemu-ga.wxs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 813d1c6ca6..73ce2c4965 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -101,8 +101,8 @@
           <Component Id="libwinpthread" Guid="{6C117C78-0F47-4B07-8F34-6BEE11643829}">
             <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll" Source="$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
           </Component>
-          <Component Id="libpcre" Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
-            <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
+          <Component Id="libpcre2" Guid="{F92A3804-B59C-419D-8F29-99A30352C156}">
+            <File Id="libpcre2_8_0.dll" Name="libpcre2-8-0.dll" Source="$(var.BIN_DIR)/libpcre2-8-0.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
@@ -153,7 +153,7 @@
       <ComponentRef Id="libssp" />
       <ComponentRef Id="libwinpthread" />
       <ComponentRef Id="registry_entries" />
-      <ComponentRef Id="libpcre" />
+      <ComponentRef Id="libpcre2" />
     </Feature>
 
     <InstallExecuteSequence>
-- 
2.38.1


