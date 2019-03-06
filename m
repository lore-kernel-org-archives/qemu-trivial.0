Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPR-00052z-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPO-000521-QM
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPM-0002FF-OW
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:22 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:45995)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPH-0002Aj-4U; Wed, 06 Mar 2019 06:08:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1M3DBb-1gxuQE3AnV-003ctU; Wed, 06 Mar 2019 12:07:28 +0100
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
Date: Wed,  6 Mar 2019 12:07:04 +0100
Message-Id: <20190306110711.309-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wh6GayCPI6nM17UeUAPbFHS9HiPp3093y6KyLqBtaaGlY9ssMFj
	DVfXq1yaO11oeJZadsFbUYXD+dlhfGhzV1LX7CCtguWE7A0CICqoqeJtu83ul8TWgHBq6vL
	PaLebjuhXPyH5ZTWGoFyqhEK+zhK8xFbbj5rrjFPt2bSGr58nppPBEsghdmJnWDVnvAjeG1
	tqw9D7/OQMAsKyKbXc/tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OgBW/YWqUOg=:tWQfodoHEesAgF7NpC2ILO
	lYG9tvaDbluhBdh1gtIqkOfJcPd+YM/TQInZ3JuNWGN7m1ZdX3gdrLAo/7GdpanK0ZgOVuJtc
	DcrIMzEBSPiPQYdxE9O+0C0LLgf2WOhE+QGT46Bf9AcQYg6pfezh925qTVogbc4T4gZytaBgh
	oPll2ruDKg0jZ+yzR4CcRSoIELrDxzzdpiBPzBh8amD+osqW8J+Zc6OchwAPk5WUXEdOU0Myh
	sf0sUAbsNJm6QcNEci9C3x9tKuP6XGvlXDke/d+ee0rx3Oe8M0As3JQKU4w3YU05S9E6Fh1vy
	QHj/Hk5YzauI33lf69ePGlNW6w7aDzrO7ThhvKWug9ywTU+3lBxX61jF8Sac4ec1nk9VgQylH
	5EoH6eiCV2gwFNfbrEgWJz0Bi1kFPUWmX3n/7XPLCiqAG51sptDA9k3yOfksjmh1VeIG9f420
	KfTikNn4DEAchU1PX4diN6kLN3+tVyv/y9cTXMk0lJbK92F3yOy9gGgIS6X0XBhSilMwSBIxb
	o/A23Uh/Pu3UIlOc64DKwlu7yTV9/VlYQb1QZDbcMvlWhYrFSR8KyjVSvV95AWiTTm9fMkZ88
	d77alk/H+2yV/Z9FpZ36bYLq6I7dtlOA2ackmZobBOEnFKum3FIiKbeOj1zWukk35iheLZHDi
	ObF3HYDvIzhecjp3QBJ6mEMbidlK4S8xP6Yi5b7rDoKgVWKJoQ5ncQ3sSUw4N/UxUsd8X1vjc
	DGAb/I4mbrpTWfy4T0TJUmibKErtpO9gmfBtKf7Z678wSGTMambIxg1Lxco=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: [Qemu-trivial] [PULL 03/10] hw/acpi: remove unused function
 acpi_table_add_builtin()
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
X-List-Received-Date: Wed, 06 Mar 2019 11:08:24 -0000

From: Wei Yang <richardw.yang@linux.intel.com>

Function acpi_table_add_builtin() is not used anymore.

Remove the definition and declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190214084939.20640-3-richardw.yang@linux.intel.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/core.c         | 6 ------
 include/hw/acpi/acpi.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 47877c0ec196..9f22b86fa9b1 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -309,12 +309,6 @@ out:
 
 static bool acpi_table_builtin = false;
 
-void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
-{
-    acpi_table_builtin = true;
-    acpi_table_add(opts, errp);
-}
-
 unsigned acpi_table_len(void *current)
 {
     struct acpi_table_header *hdr = current - sizeof(hdr->_length);
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index bbf541263a19..c91e2b9df28b 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -190,7 +190,6 @@ uint8_t *acpi_table_first(void);
 uint8_t *acpi_table_next(uint8_t *current);
 unsigned acpi_table_len(void *current);
 void acpi_table_add(const QemuOpts *opts, Error **errp);
-void acpi_table_add_builtin(const QemuOpts *opts, Error **errp);
 
 typedef struct AcpiSlicOem AcpiSlicOem;
 struct AcpiSlicOem {
-- 
2.20.1


