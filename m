Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPY-0005CC-9w
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPV-000568-Ad
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPU-0002Ko-BZ
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPO-0002Cm-Qi; Wed, 06 Mar 2019 06:08:24 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MBltK-1gpLqA0qM8-00C7Kz; Wed, 06 Mar 2019 12:07:30 +0100
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
	Pierre Morel <pmorel@linux.ibm.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed,  6 Mar 2019 12:07:05 +0100
Message-Id: <20190306110711.309-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dcj3jzsg2nLHNGpxFgIRqxVnWZJR0nOrv43RLnYFAu8XvNaGhm/
	DTzj5ky+Lj1ZVRXXWeo71WsnmUj7KTkxHkuqd+Ubi02XaOKM8CEzcmk5LQdCB9kMqpZpeHl
	JkPiC0p45Vh7zgxu32Eahe6XvDAMVav3yxWsavEyVx0+3AwrobJMIqzy5/Uf0ZCSUbqOqKz
	+wPQUk4+0tGCAhbrDyKeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fJ4cdu6Gp6I=:ZdZPZc3HGqRSTzl9cAwiF+
	INvtqi4Y3xxkpU4X2diqFeqtda9wc/dNX2J5wqwflyX71GZ2pmAHe0vq2cP9zGgTzaBWGmMnr
	7w32YIRjmEFAfjbdOaj/7gu9huMXTln3zol6KM8zbHufpWr8DMTCEc/aGgWOgDnVySsIXEgvk
	OUwjQfH2Tw+6+XtIx/lD/434TgblZC4dcZDs4q/lrtBKyanF8oQGdU80fcK2JKQ8rsKXHPEOS
	nQzNvqZ9g/7wLciJszL5wzhxVl7OwjSgozxERn5EjE99MDH4ctIcQxQ+YTKxUcpmHkg/VSpUX
	kKYSHBwxYSrOjOhg5AOltAkgbRjd1B9VIrgKQBIkg/kZdoDTJgxV5P56yo0DILU5Go4HP/cKL
	n/hdnBzqBX0RWTlXQc0HOu4w4fYj5qehlha7qLPnJLQsWo5+XXA5dezFuCE0AVOTXEecmFh50
	GOV+ipOCa5ku/lth9kKdhmAGMsbdxRO6UQY74zuYdfGubd+TiEk7imEQvVkAkmPotuzqv0ddT
	U9QYAkOYXnTDlHPI/6dHapeG/IOfyjFqfQ6GJSD2COe6mIA8bc8RB4ZynuL+M9sDzJ/wUAZXQ
	spDjLraYGudrBcKIw3b/OF4lH9F/ynf9Z/zRh5g81Sw8Z1jaiT1CBmYdgrC9Q0QmNakSDlonO
	5Zle+rNNB4jO9yDGAw1ProutaRVmznmgGZzQZ7RgN2xUJzz4ff/e5BPhbqM8KqVfbBIr4SqAq
	BAzYItVDwvgUve+42yF0EVZnvHHP9v03nD0B2j2UQlWyPZ6y7M6PDiM3VHY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 04/10] hw/acpi: remove unnecessary variable
 acpi_table_builtin
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:30 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

acpi_table_builtin is now always false, it is not necessary to check it
again.

This patch just removes it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190214084939.20640-4-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 9f22b86fa9b1..9ed1629f3671 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -307,8 +307,6 @@ out:
     error_propagate(errp, err);
 }
 
-static bool acpi_table_builtin = false;
-
 unsigned acpi_table_len(void *current)
 {
     struct acpi_table_header *hdr = current - sizeof(hdr->_length);
@@ -324,7 +322,7 @@ void *acpi_table_hdr(void *h)
 
 uint8_t *acpi_table_first(void)
 {
-    if (acpi_table_builtin || !acpi_tables) {
+    if (!acpi_tables) {
         return NULL;
     }
     return acpi_table_hdr(acpi_tables + ACPI_TABLE_PFX_SIZE);
-- 
2.20.1


