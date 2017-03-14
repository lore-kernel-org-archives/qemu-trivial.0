Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnnhO-00030x-Gr
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 10:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnnhM-0002zb-Lg
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 10:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnnhJ-0007H9-EA
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 10:45:16 -0400
Received: from www145.your-server.de ([78.47.15.66]:34906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andreas@grapentin.org>)
	id 1cnnhJ-0007GI-6k; Tue, 14 Mar 2017 10:45:13 -0400
Received: from [88.198.220.132] (helo=sslproxy03.your-server.de)
	by www145.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnnhH-0006IK-UN; Tue, 14 Mar 2017 15:45:11 +0100
Received: from [141.89.226.146] (helo=parabola-pocket.hpi.uni-potsdam.de)
	by sslproxy03.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.84_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnnhH-0007SJ-Hk; Tue, 14 Mar 2017 15:45:11 +0100
From: Andreas Grapentin <andreas@grapentin.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Andreas Grapentin <andreas@grapentin.org>
Date: Tue, 14 Mar 2017 15:44:53 +0100
Message-Id: <20170314144453.5027-2-andreas@grapentin.org>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170314144453.5027-1-andreas@grapentin.org>
References: <20170314144453.5027-1-andreas@grapentin.org>
X-Authenticated-Sender: andreas@grapentin.org
X-Virus-Scanned: Clear (ClamAV 0.99.2/23203/Tue Mar 14 13:13:21 2017)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 78.47.15.66
Subject: [Qemu-trivial] [PATCH 1/1] added configure check for _Static_assert
 and updated QEMU_BUILD_BUG_ON(...) accordingly
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Mar 2017 14:45:17 -0000

---
 configure               | 18 ++++++++++++++++++
 include/qemu/compiler.h |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 75c7c3526c..e9b33d9cf8 100755
--- a/configure
+++ b/configure
@@ -4725,6 +4725,20 @@ if compile_prog "" "" ; then
 fi
 
 ##########################################
+# check for _Static_assert()
+
+have_static_assert=no
+cat > $TMPC << EOF
+_Static_assert(1, "success.");
+int main(void) {
+    return 0;
+}
+EOF
+if compile_prog "" "" ; then
+    have_static_assert=yes
+fi
+
+##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
 
@@ -5694,6 +5708,10 @@ if test "$have_sysmacros" = "yes" ; then
   echo "CONFIG_SYSMACROS=y" >> $config_host_mak
 fi
 
+if test "$have_static_assert" = "yes" ; then
+  echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
+fi
+
 # Hold two types of flag:
 #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting the name on
 #                                     a thread we have a handle to
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index e0ce9ffb28..37a65d4bb7 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -90,7 +90,9 @@
         int:(x) ? -1 : 1; \
     }
 
-#ifdef __COUNTER__
+#if defined(CONFIG_STATIC_ASSERT)
+#define QEMU_BUILD_BUG_ON(x) _Static_assert(!(x), #x)
+#elif defined(__COUNTER__)
 #define QEMU_BUILD_BUG_ON(x) typedef QEMU_BUILD_BUG_ON_STRUCT(x) \
     glue(qemu_build_bug_on__, __COUNTER__) __attribute__((unused))
 #else
-- 
2.12.0


