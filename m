Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDej-0003Bu-FT
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDeh-00036E-GG
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDbx-0000FZ-Kt
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:37 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37655)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbm-00008h-G8; Wed, 09 Jan 2019 08:09:23 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MlsWZ-1h7ieH1ZPH-00j2M8; Wed, 09 Jan 2019 14:08:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Anthony Green <green@moxielogic.com>, John Snow <jsnow@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <philmd@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Date: Wed,  9 Jan 2019 14:08:40 +0100
Message-Id: <20190109130844.5172-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
References: <20190109130844.5172-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ebbmJ/kMcCm8S0YKvyTW72w1/gy2msEqaWMQxOFdi7wQgN/sJtr
	TVedsCwNiT6Cq40nCq4ZsZLmXE0QjcQKVTqkU0FRUMtTMDlACZORkkzzHI1aRo4fad7OEJJ
	0motCutmz678LQcQJpyuNVRGNPpSi9rSmjimAOeWm38OtHP9pKB8H6hKg5btqmErhhjmw46
	8o9H6PfyQaGF80VsK5+ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qcu3PCtDvRY=:26Y4LwA9wi0K5BcFgfk3Od
	vpZ5SF4fH9hZ5YHoRY+GXKgodykg1CXwgliGfU+UtAwQ+Av/4Gi+RjB1wwBlrY8KuE2ZaK2CR
	IDBQt+NEdID8Ash+4XQQp34BA7FrsMm4onaGjuiyQb0UIqYaKBpBFwuM02k3MuL4bkWIeaSN5
	A8+pwjIknziQ9XqSzjX7zxsY0TNQ6K7inJY4luw1syo4xYgTsMmodyY8i4xi+DdtEbU4+UTUY
	Led1NjhmuiB7NgHZkahTqFEGqKVDf5KKTFzSSvwGO0BeqKsV7QACc1op5g1wKYeVh0KuNhIR2
	S662zd4CGS/3HTMIcbrRy+CTQG52rXBR6HU47tJx1SzhCmv6qc5oV9oe4Afi/YQW7lKxZ/Js4
	kFtrV5IzgAuqERNN2ViLbo4JRtyaT7tHG2JjtWIYBp9OnfByuinY3tJYwTXXDCMolKQeWlJSC
	N32eJkqZ/3KX0tkW/Ov9gpxuawpFPHaPG62gnl2WPoPl0sfW/SzHmUDtbbeYrRT1ph79HTnW8
	SznhyNYqqGGsDB9I8Nikm2qc+MvpmzRrvmkDmvCMeCcF7Oy06PSqrDecc7avKoJd7cmrDOW4p
	5Su/BBDUVziPQl+OO8ccOug0slIFxqXXCrWQGgIz1R1oEWG2S7VQp+Flsr9R84qISWf3aLTUB
	4w5/GNbAqWxNriEmAEibpGFhqaTuBh5HddEph4vpmLnAuTjd1W+uuO5IGa0Ox2g9o5pc9kGNs
	Mkgq601+bFShT4zDNBT7iX8iaHwW0/j84R2L9cv0CaSrY/NxdSLDCl1L2qE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 2/6] hw/core: fix whitespace in a sentence
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:24 -0000

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181224154922.3338-1-wainersm@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f8563efb86..1a0a9ab111 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -919,7 +919,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "dump-guest-core",
         machine_get_dump_guest_core, machine_set_dump_guest_core, &error_abort);
     object_class_property_set_description(oc, "dump-guest-core",
-        "Include guest memory in  a core dump", &error_abort);
+        "Include guest memory in a core dump", &error_abort);
 
     object_class_property_add_bool(oc, "mem-merge",
         machine_get_mem_merge, machine_set_mem_merge, &error_abort);
-- 
2.20.1


