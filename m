Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGA-0004oY-6q
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG5-0004gG-Er
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaG4-0003gD-Ci
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:21:57 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:38713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaFz-0003d2-Gh; Wed, 06 Jun 2018 11:21:51 -0400
Received: by mail-qt0-x22e.google.com with SMTP id x34-v6so6739588qtk.5;
	Wed, 06 Jun 2018 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zITmvmGYVZ3GWtfokmZDSelQaAvJJrYrYMSkGEZMSTk=;
	b=R8FC4HDuk6Wmq7Pvxp3AF8O+HAQA6vvKB3jHlPsjQje5Ot87tF4w1jj8Mzop85N19B
	qtQgQ0acaabnHDI/iuPhk2As4/0SniIoUoF1y7zsx1DUkiLW7thwkBpcuolN929h39dF
	JW/Y2c8a+70Wjs/lP7mzR1NxQbWqDTxOpPdJgJ57kiV21E7EBTYFD1Cm8bUDcUydUmsu
	PQfkHMBavvdPXPaA0o2UFSVq0g3MQnDxbesDoZQsxFLuZa/TW+D+iVHo5WEYwaSpX1nq
	Rm5CxbiLa+Fn4FCIdAyFp7bnxNWwqMZwIMEtDDhORJ0pVT1h/YWMGyx0DuTYNkKbvPwQ
	ebzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zITmvmGYVZ3GWtfokmZDSelQaAvJJrYrYMSkGEZMSTk=;
	b=eROWF0tyckA7PnQXwnCGoulUKfOs0G3slOK+WlAfKBTXErKSmsRIk2qeYBciyGawxE
	GE0mJKmG3vOqE1D+vd2OPR4fkr3i4UDcbQr9BqjWk7784nLK21jzsHQYJN7Qv/qpxN2J
	1DmWl2/dJeR2qigfjLddhJUYMGGVQMg01t8drTmyfYUP4ZTW8KidN6GPeR67zlZNfzp7
	SOYypp2x1PH+zOsQFpJ01zrKhcMozQe2UuVeWs1uFMNGHwyuQyVwS5nRrfVIsCY9cYPN
	RxV2r/GEZJzHmuf3npBFsBbO9nTzlrR+ENDx4SKV1LnIcNZ/bRef9iU4UROcgMMt4ui4
	UgUQ==
X-Gm-Message-State: APt69E0TiC5xFenSNP3W4mc7kfdDqNQpwpdKyTz6jbYg+mVntZu5PNAW
	80lFLvvMCxO7QsCv/CiBdNM=
X-Google-Smtp-Source: ADUXVKK3Xdnm51Hi16i279FbrKs9EZhuJlhJKOzbkkGiXQtTlAGRy11Mzo2DOVA5K2lma4UB/r2YPw==
X-Received: by 2002:aed:3fec:: with SMTP id
	w41-v6mr3139017qth.15.1528298511034; 
	Wed, 06 Jun 2018 08:21:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:21:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 12:21:21 -0300
Message-Id: <20180606152128.449-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-trivial] [PATCH 04/11] ppc/pnv: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:00 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/pnv_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index cbb64ad9e7..13ad7d9e04 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -97,7 +97,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, hwaddr addr,
         val = 0x24f000000000000ull;
         break;
     default:
-        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=0x%" HWADDR_PRIx,
+        qemu_log_mask(LOG_UNIMP, "Warning: reading reg=0x%" HWADDR_PRIx "\n",
                   addr);
     }
 
@@ -107,7 +107,7 @@ static uint64_t pnv_core_xscom_read(void *opaque, hwaddr addr,
 static void pnv_core_xscom_write(void *opaque, hwaddr addr, uint64_t val,
                                  unsigned int width)
 {
-    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=0x%" HWADDR_PRIx,
+    qemu_log_mask(LOG_UNIMP, "Warning: writing to reg=0x%" HWADDR_PRIx "\n",
                   addr);
 }
 
-- 
2.17.1


