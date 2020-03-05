Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9nii-0000Ap-Ur
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 05:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9nig-0000AQ-HC
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:27:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9nif-0007xq-4m
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:27:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22844
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9nie-0007xD-W9
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 05:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583404028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=glnZh63agBY9jTgHy4oFd+qzRVfbjw7LMtpKPPibQwY=;
 b=Et00Ea/glSg9N/7SiSsf1HXMnWMqSrEQPI95S8DF4LlxJwcrxL392Nqos0Wojnw9k+cgID
 9j5Cr1ARkz2PgOl+7d8x1FgEqRydv8P8/zKTqPhOGEaxwrblfcEZpgEYO+ATeYGjHc2Kfx
 rwiUwLG0Q4AuE/WGawM4pcnqfFm5Uks=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-rANmVVEaOVKm0BbEuPd_Rg-1; Thu, 05 Mar 2020 05:27:06 -0500
X-MC-Unique: rANmVVEaOVKm0BbEuPd_Rg-1
Received: by mail-ed1-f70.google.com with SMTP id a1so583254edv.8
 for <qemu-trivial@nongnu.org>; Thu, 05 Mar 2020 02:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlYR1W8zAZXcdKzJjizsFD/7Jmu1H/2LfMgVC3H1d9M=;
 b=BG5fYiJPAQFYAN1pdgMmJ6r7brZcCssWS+CIrBZj/xDT9SsVVVzp3ob30vvFCPeu6/
 6jLSrW+E7LvmPn4CCxvOFlEhLE+ouR/xuxWN+yzOkM/WawN+JslLUEJw1lJBCdxFJ3PA
 KoB98gkfUjrOnNuvJsi+3GlyXV8Xw9N7P80YjQwovjF7DhnEIzWJRVbcOHBwF2IIHVHe
 CymztErZu/oSCBMCEOdT2b+iP8Ab/ZqGkEZ2xWheLIHvDpbHHxcdLVYfE4xz2Bo5+h8g
 5m6/mUV2rhKpXcvy2ZntRtyb8Pkre9a7W+yM2tzc8jHiQFAuNTQ0DZDBRDw+72Z9spXR
 iniA==
X-Gm-Message-State: ANhLgQ3jTCUl+XtD5rHm62cOSzo34MZlE6BTbQESrJtUlA6KwHuqgJox
 VnVA1MVwLc0uPm4SOBuhOtu14Cah0Y8frbWSVxrnyf6dD6fMxMsk/GPXxGF4NoZnQw8X9IsHKBa
 zbPLGq3Gy2OMFhbsX+A==
X-Received: by 2002:a05:6402:1481:: with SMTP id
 e1mr7536891edv.219.1583404025220; 
 Thu, 05 Mar 2020 02:27:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvCWVROkqixQzTZ5oXhvzzm2LLJyWWOo1alqJISLP5GP2X9Ktr5PVSfzKA+1q45rTlehYcP/g==
X-Received: by 2002:a05:6402:1481:: with SMTP id
 e1mr7536865edv.219.1583404025033; 
 Thu, 05 Mar 2020 02:27:05 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f25sm1858980edt.73.2020.03.05.02.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 02:27:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Yi Sun <yi.y.sun@linux.intel.com>, Liu Yi L <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4] hw/i386/intel_iommu: Simplify vtd_find_as_from_bus_num()
 logic
Date: Thu,  5 Mar 2020 11:27:02 +0100
Message-Id: <20200305102702.31512-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Thu, 05 Mar 2020 10:27:11 -0000

The vtd_find_as_from_bus_num() function was introduced (in commit
dbaabb25f) in a code format that could return an incorrect pointer,
which was later fixed by commit a2e1cd41ccf.
We could have avoided this by writing the if() statement differently.
Do it now, in case this function is re-used. The code is easier to
review (harder to miss bugs).

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Since v1: Re-worded commit description, patch sent without -w.
Since v2: patch send without diff
Since v3: Fix typo in description and comment (Eric Auger)

This patch is easier to review with 'git-diff -w' (--ignore-all-space)
---
 hw/i386/intel_iommu.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6258c58ac9..204b6841ec 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -987,24 +987,26 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, ui=
nt32_t level)
 static VTDBus *vtd_find_as_from_bus_num(IntelIOMMUState *s, uint8_t bus_nu=
m)
 {
     VTDBus *vtd_bus =3D s->vtd_as_by_bus_num[bus_num];
-    if (!vtd_bus) {
-        /*
-         * Iterate over the registered buses to find the one which
-         * currently hold this bus number, and update the bus_num
-         * lookup table:
-         */
-        GHashTableIter iter;
+    GHashTableIter iter;
=20
-        g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
-        while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
-            if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
-                s->vtd_as_by_bus_num[bus_num] =3D vtd_bus;
-                return vtd_bus;
-            }
-        }
-        vtd_bus =3D NULL;
+    if (vtd_bus) {
+        return vtd_bus;
     }
-    return vtd_bus;
+
+    /*
+     * Iterate over the registered buses to find the one which
+     * currently holds this bus number and update the bus_num
+     * lookup table.
+     */
+    g_hash_table_iter_init(&iter, s->vtd_as_by_busptr);
+    while (g_hash_table_iter_next(&iter, NULL, (void **)&vtd_bus)) {
+        if (pci_bus_num(vtd_bus->bus) =3D=3D bus_num) {
+            s->vtd_as_by_bus_num[bus_num] =3D vtd_bus;
+            return vtd_bus;
+        }
+    }
+
+    return NULL;
 }
=20
 /* Given the @iova, get relevant @slptep. @slpte_level will be the last le=
vel
--=20
2.21.1


