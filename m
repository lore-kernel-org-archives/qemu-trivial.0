Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS03V-0000DH-90
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2019 09:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03R-000088-06
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03P-0002mO-TI
 for qemu-trivial@nongnu.org; Tue, 05 Nov 2019 09:43:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55037)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03F-0002fa-0J; Tue, 05 Nov 2019 09:43:21 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNOZO-1iHcpa0A94-00OnFO; Tue, 05 Nov 2019 15:43:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-ppc@nongnu.org,
 Paul Durrant <paul@xen.org>, Michael Tokarev <mjt@tls.msk.ru>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Cleber Rosa <crosa@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: [PULL 3/4] qom: Fix error message in object_class_property_add()
Date: Tue,  5 Nov 2019 15:42:46 +0100
Message-Id: <20191105144247.10301-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6lLJMzjHAvmf+zbwEIjFaYmgyD4Xp9wj/yXBg2phAoLtjGTLNyf
 jFjRccWeRNCD3ubmrfEp6pKPVm7zFgjB+CKCqYNlLfEM0oSrYgQF1m5aP+VPUibYsU/asll
 l0BTqu8MMLy2rC5IlFC/P74gFDbdiPqYjDS81gLzgE669CpGIkKZX6QpwL+i+h9nd3ihAHs
 k0aU8H/oBeIugwumgO8KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9IzBdaTOrfc=:WVe7Hft7P5ufdiP75OVziB
 x8KctqAt8Cv13LcM75gj++4dutEn1v6LhQCSchEOYg+3tcCUGhIt50OpmFgITwSRxocBrT6e1
 bLP2HAWKwgcU66M482GnlsGwKAOwQSJubLVIpHxdSfMoOFUbTgySaV4aNsT8/NXQ44Ekpb6dj
 fkHmWUkptVIFOgHWCV8k7MOqOuGhzS4yhquR6JINooEiJtgAdBX7i7cYnis4JxR90Rq7mGqcm
 r8TB5sXsaFdr2oMLgWl23Fv+1rChP4I+6k371AwGaZIom+FcxtKUVlK9SnhPQErgGNMr0eaKv
 exQ23WnT7L0Q80b1ybigTikE0TmleJRNc/kVNs/6G0L9AQ6yIZpFpWoDb8rBApCbyt4ShbJPU
 ANLd4+KPQn2ALCD9oXPCD7JYQEAmtSclO/2X9fYeMaRedVAseex7WifatctvkBWGZ1NbpXfpD
 VJAmA+VGKVzMy1hC7r8S19oX6SnbiFpS6KrzdL+UBRPD6cYUfU1TMWr53tI+RSeydqA6CF7d+
 cI0ZBSSQ+ydwV0IgBhHd90uy2gMyoxuwEn2wacAXtC6zUy/R8Hdu1de7EpV6skhW6Dzb+TXyq
 nHnuwiwgIrNcSkeEn44cN7ThC6TWlXbVEo2lK+e/FtwcX2dLjRb9+7BAMOFpVcc1jnv03IeI6
 Y2l5mm0yZ489zSr+dbjUHxYaHF2spJzvD7vxmkeDD3V//U+togeiqoOm5AXdQJAcBcH1zAy3D
 b6tewJkju/xecXIYUa9kGmGwLWBWI1IMTK2wQ6W8+NQpz2/P78nHKQuxG6cQwqQI/rPdhAViP
 QWZcUcoFU7WV3kHIckvdm551ETQMMONk8tpB6dkM4yh7dSXhZjSapaolihSSiV7SlsFh/jcva
 rfBzTogkwOQAHn9mOXYA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 14:43:36 -0000

From: Greg Kurz <groug@kaod.org>

The error message in object_class_property_add() was copied from
object_property_add() in commit 16bf7f522a2ff. Clarify that it is
about a class, not an object.

While here, have the format string in both functions to fit in a
single line for better grep-ability, despite the checkpatch warning.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <157287383591.234942.311840593519058490.stgit@bahia.tlslab.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qom/object.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6fa9c619fac4..d51b57fba11e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1106,9 +1106,8 @@ object_property_add(Object *obj, const char *name, const char *type,
     }
 
     if (object_property_find(obj, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_get_typename(obj));
+        error_setg(errp, "attempt to add duplicate property '%s' to object (type '%s')",
+                   name, object_get_typename(obj));
         return NULL;
     }
 
@@ -1139,9 +1138,8 @@ object_class_property_add(ObjectClass *klass,
     ObjectProperty *prop;
 
     if (object_class_property_find(klass, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_class_get_name(klass));
+        error_setg(errp, "attempt to add duplicate property '%s' to class (type '%s')",
+                   name, object_class_get_name(klass));
         return NULL;
     }
 
-- 
2.21.0


