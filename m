Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UQW-00066g-16
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UQO-0005yv-5D
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:09:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UQE-0002mc-8d
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:09:22 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:45211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPQ-0002DB-6B; Wed, 06 Mar 2019 06:08:24 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1Mg6mG-1hSJYz1dCY-00hcbj; Wed, 06 Mar 2019 12:07:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>, Corey Minyard <cminyard@mvista.com>
Date: Wed,  6 Mar 2019 12:07:02 +0100
Message-Id: <20190306110711.309-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q3hk8qijD5KUlzCX23w0FWN0YpKiKd/7xr6qFZcEo8PLB8u8yfX
	vwCU01TcPv4ex5BZ7A+BddktVxYRMFof/lQqi/2RhrLTxAZExppSELttcY/aR4S88vFEbA8
	gwsmlRgnqlsBBOxTx0F0eLIsSbkKUgkWyHOixueqLu3CfMbhpd8yC4ww1zAgFBVfhrfL3np
	usahS5fOCRRfPavkpW29A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qpDPq41EuXc=:8F4TerVI713vWXfl+T7WWE
	KvuD7Suq9FYNPM0fBIYJUX45lmGIY5/Brj9PeshcFybRtT1VN+FoV3KHJNxP1bpVxTm3XsnPT
	XxyMXVLilr0Z/iou/CD1Gwf0ZDhjgKNW65TsIUoRVjEPxXxLG25QxSR48QlY+vw5pfRtAkQOp
	V2wyxoYZlWYLMWyVlBfIoUuv4ko6NxmapVeqUcTJpcxzuTAvTEOSDlsxEgDeTOlNmJt1aWHIs
	q+s2dyEIIVfTrC0EeZ4ZuVcmarkwVg3jXlnMych1msYbfjgLWnFhdeNSpwU8iUFup5qp/Bp1l
	ELp9JG8FO/51hDHWNPhAiA9yD8A6uJvtpTmw4HGGsctWuGSizRRFRRdSeCT4LxB7SY75CKWwm
	MS5rb4lnJcuBKK9wVfleu093GCz6mHSJDLomCaSh+B0I/8YtNLKv4o6wkbQikWBdXcY/XDQXB
	R/ZaI/N54Z5eVy5F72mDLaDbAksMEbg0SOJZduSItLBZa66N5BSY9sAN/ZVY6WriUDlVlUDlL
	YHeAthu9gSxQsWz9XpsF6HX+NZQaqVq2i/4L1tHxkUZgHqtnLC/KjxCmdVOkPLBkANEzzjTgV
	IWwmftVZZZXePgkGGtBBtf4P4sYHPnZEHyHwy2N8zQZFrRSzuKPEKpQgg1h5kDHczZO9U1V2a
	N/EHWaB2b4PruEFoF0N/kH495/TySkmCNMgMfSFf81cKlWNUOfalb/CLeADAhExbHCB0q3EfM
	7iJ/5mGRpno964KYVum9ueWkof9lwVqME7DhKQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-trivial] [PULL 01/10] tests: Remove (mostly) useless
 architecture checks
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
X-List-Received-Date: Wed, 06 Mar 2019 11:09:31 -0000

From: Thomas Huth <thuth@redhat.com>

These checks at the beginning of some of the tests are mostly useless:
We only run the tests on x86 anyway, and g_test_message() does not
print anything unless you call g_test_init() first.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <1551456970-463-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/fdc-test.c      | 7 -------
 tests/ide-test.c      | 7 -------
 tests/ipmi-bt-test.c  | 7 -------
 tests/ipmi-kcs-test.c | 7 -------
 4 files changed, 28 deletions(-)

diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 88f1abfa10e2..31cd3295c102 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -548,16 +548,9 @@ static void fuzz_registers(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int fd;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Create a temporary raw image */
     fd = mkstemp(test_image);
     g_assert(fd >= 0);
diff --git a/tests/ide-test.c b/tests/ide-test.c
index f0280e636b5d..300d64e77ddf 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -1009,16 +1009,9 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int fd;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Create temporary blkdebug instructions */
     fd = mkstemp(debug_path);
     g_assert(fd >= 0);
diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
index f4a81b526505..fc4c83b5db7c 100644
--- a/tests/ipmi-bt-test.c
+++ b/tests/ipmi-bt-test.c
@@ -400,15 +400,8 @@ static void open_socket(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     open_socket();
 
     /* Run the tests */
diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
index 178ffc179734..a2354c10c7fe 100644
--- a/tests/ipmi-kcs-test.c
+++ b/tests/ipmi-kcs-test.c
@@ -263,16 +263,9 @@ static void test_enable_irq(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
     char *cmdline;
     int ret;
 
-    /* Check architecture */
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
-        g_test_message("Skipping test for non-x86\n");
-        return 0;
-    }
-
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
-- 
2.20.1


