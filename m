Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Keg-0000nA-HR
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 15:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0000mC-BB
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 15:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kec-0005va-Qd
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 15:48:40 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26457)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kec-0005uW-NQ
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 15:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBf1Nz3dO7lmnq6x8HgckUD4/9P7/UEzlUI+mgbV/5Q=;
 b=XMj7UkRy2EpxhnTeNtl2VVqUfFnxHqfFiLuDbQCuM9B7KNj6x/QlXSe9Dtze/eNk9x2/U3
 +6PQU0RI3AUYB15gHeKDUfCq/1U0yPNBMhb1SYEGciP9jmcdsW6wEiXVl5Pw/KoAH1VCVU
 Bot3eIAmmMkzuDVrDtxWRkC2dBAziSg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-BV7WFwA3N3-WN2aFasdLiw-1; Mon, 24 Feb 2020 15:48:35 -0500
X-MC-Unique: BV7WFwA3N3-WN2aFasdLiw-1
Received: by mail-wm1-f70.google.com with SMTP id u11so239067wmb.4
 for <qemu-trivial@nongnu.org>; Mon, 24 Feb 2020 12:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9F9enB4mqr+YPnaVrLHGBnKs+NXe+icyfAm27ef64A=;
 b=slK7nFEcaTjvg+mt/Cbx4/6wi6gEzkdIC+SxwS7E9zM89xndtdcZEpxIg063xRu9q5
 KdwyFQXWbDW2EbX1C8ucHmLv3/PaubEpsA7ZhRb8xIArjXiJDqCaSxcGUTl7qhsNPZSx
 mQkAMdWipnw3izG6OWL2g4yuV6RZuFtVYCB4ZiKx8NRxQnGEr0mJlG7wLpUdRaQCzdJO
 dPOVNmjQ9Pgt/MfT2Wkuq/pBSvcOd8N1QkeACd+jt+jPnSCkukcKuu4rapnoeMjqwqjF
 vdsDG7OUnHL4vh+nlmTadCwzekJeq7KdLqyE2KEr8k3wD4+xpfzg/HDs60nB/qFjmT93
 p4jA==
X-Gm-Message-State: APjAAAUS7aVQCZJz5S/W1vj07vSl8XeLkawQ1GFK0iwSRXJATp5fLV5I
 D6n9upn2OQDpGi9QzRUURlQdSj9ZwJxYT2nGxRzVfMX1m/IXccCK5jwU405/RZSS1HA50AmH9gh
 XHWkd2LcQf20tFAbZ1A==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805782wmk.15.1582577314794;
 Mon, 24 Feb 2020 12:48:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxBizVAfehGk3miduLVPYkPJAIfgR+35+r8qEsbPuDdZQRaeyaOJy4zQqQ4Y2N2h4q3ZdVrQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr805686wmk.15.1582577313662;
 Mon, 24 Feb 2020 12:48:33 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Max Reitz <mreitz@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Fabien Chouteau <chouteau@adacore.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-trivial@nongnu.org
Subject: [PATCH v2 01/32] memory: Correctly return alias region type
Date: Mon, 24 Feb 2020 21:47:57 +0100
Message-Id: <20200224204828.23167-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224204828.23167-1-philmd@redhat.com>
References: <20200224204828.23167-1-philmd@redhat.com>
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
X-List-Received-Date: Mon, 24 Feb 2020 20:48:41 -0000

Since memory region aliases are neither rom nor ram, they are
described as i/o, which is often incorrect. Return instead the
type of the original region we are aliasing.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/memory.c b/memory.c
index aeaa8dcc9e..ce1179874e 100644
--- a/memory.c
+++ b/memory.c
@@ -2818,6 +2818,9 @@ void address_space_destroy(AddressSpace *as)
=20
 static const char *memory_region_type(MemoryRegion *mr)
 {
+    if (mr->alias) {
+        return memory_region_type(mr->alias);
+    }
     if (memory_region_is_ram_device(mr)) {
         return "ramd";
     } else if (memory_region_is_romd(mr)) {
--=20
2.21.1


