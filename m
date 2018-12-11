Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOU-0007bg-P8
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOT-0007aM-GA
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOS-000753-F4
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:29 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37437)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOM-00070C-QM; Tue, 11 Dec 2018 13:04:23 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1M7ehh-1gXZjQ0cdJ-00863E; Tue, 11 Dec 2018 19:04:09 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue, 11 Dec 2018 19:03:32 +0100
Message-Id: <20181211180352.19644-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UmTovMzq7Ev70M0acJB82RLDIVFoXLfIJ53A0cdzSeb1ZAB72MG
	cdQml1KHVFbgKpdzERsEAPHVYkbwPcz+r49a+fk2DUjlwra3ejxaFMpjh2rhjEuqMPKZyTp
	Vc9J7IU6fnMbU/7k1+PXSZ1H16AreGZzbHREK1rGFnsC4boJg78UI2NnwAcd63ePPXinv8I
	2UVk6R8erFphF6eNZq+AA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1rmtrhTav1c=:/ZDgbcmeeH0Z8sdCr543Jt
	d5nFcT7V4LdcGY8kHEjgTSaSAxIg6WbrdxjocmNSKx5qdgL669v20VCSOfiNOMLjFY4cqKQV0
	fne5iXKMrfCphG50yLnzHEiKhTWqcXz/18ZI3BZeoAUyiaMIaHotuHbbFe/rtmwYj8GMrZbxI
	YVDBTZCQppTqFVlOpgDtCbUk1/qKHX11EGNe9RN+4oAHRUv3qQK2Db/minukU1JIMrXRq9vUR
	N9DUzAosI0rMMksbmXg1LAKeuQe8+nMEPaBnAwXwPG2r77yI0DpJSooJexYzAHIhAF8Gi/uT0
	QP0MhnwsLLQiOiQGVh9gDsIbV4LoC5NpOWdvVXGODhI/bdFk/uPI+I2yLu3Kaqve57PoV/xQj
	CsFpfxiJl4nBWD7+YbspGLhEkDdxgJ4iev8VPSLi/ieXovcURgW3+zJLr1VegbQhia1sjU3wq
	uCDS2xfM+3lNz8a+/aDj3ERSBPfJCtt1bfi7PmbRHfHFHHl+LIP2cGoW3vYvmMG0fo4olY0uS
	rA6SmPWyTtM0W3Bk3izW96aZOn3Nxyy0wb486xllMLptiVzxX1/zSwRf8b8xFXcYA2v1B2/j/
	oy9GOOqNy6AQqYJ37s5XSDHMpD+6Ckf/1PZA/MEsfaO937Y5aPYjfoaPU3lp7dvonJI/E6HrI
	yy5Fv2L7ProuHfWL2vLyzPifKn4ovv4ffw9I8tEOWUPqWJbJ8uaK1FEB7cjGkxBuvIVonx29Y
	4Hhvhw/+GqspJneLhUJTLLkZhV+F5b3SN0GJJwc52v3xIzFKFJ5GDK6/p0Q=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 10/30] MAINTAINERS: Fix ACPI tests data files
 path
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:30 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Missed while moving those files in 438c78dab75.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181125205000.10324-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5ef20d359..59233c2139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1252,8 +1252,7 @@ F: hw/i386/acpi-build.[hc]
 F: hw/arm/virt-acpi-build.c
 F: tests/bios-tables-test.c
 F: tests/acpi-utils.[hc]
-F: tests/acpi-test-data/*
-F: tests/acpi-test-data/*/*
+F: tests/data/acpi/
 
 ppc4xx
 M: David Gibson <david@gibson.dropbear.id.au>
-- 
2.19.2


