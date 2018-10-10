Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAMzP-00006v-KS
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 18:29:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzN-0008WH-HB
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzM-0002g9-S8
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:29:57 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzI-0002dK-2x; Wed, 10 Oct 2018 18:29:52 -0400
Received: by mail-wr1-x442.google.com with SMTP id e4-v6so7466344wrs.0;
	Wed, 10 Oct 2018 15:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+pvesXanFKnEV/oh0fK1kkjgnm7K/k0QKmfWa8cm2xk=;
	b=AA/7Vz8lzNvM+hR5rzWF3Hzrk08PIGXI/YqH2/YnT0bhYe3QVbQqzCgbQn0DhtVXtG
	oJb6IAuGh21a4sFS4wmRj1L7nHUFnAw+8r5NHUUTCYcXDKsDjiL/5/yvCSE0nbiGPO0d
	2dy8cXJcRV6lTFSobMgWUyEXsjqkmISFQywNH08bphtD3LsI9J7KU4xqS/AajmweZYBn
	TLInz6EPf+IQvChUlGaP5QkKZvs9Ja+zuuUpb/u6n66SW3pP/tfXfGmWEKQWHXp0Rloj
	wi977FzcRchDicHtkaqrVxLJ7cC5EvL/G5vDw2TCsENY3fo4e4L0tIeWkJn30ubv0bUk
	GzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+pvesXanFKnEV/oh0fK1kkjgnm7K/k0QKmfWa8cm2xk=;
	b=UmbtGS/t2/4epzBqPGAfyjqKVDhNX93JgvLEynfrj0p1mtIaNeMItb5GOZL+DCtARM
	C+TcXQN8JuLRrXnKOxMGeypjxndSEY7sHVXpjTvXO4fWFEBYEi564eXLhS0RA9a33Uq6
	LP/VoiV1gYyFwbOkpTWcTaEGoOeoyqewBnE0X6L9nGXjUQit1F91Ai7uIe0bF1b5fDhs
	K0V+xirkt2SIRdIWsbHhB0ODrVsshHg4K6mRg8/3xcQPDE8eZobJo+Zy7ygNiTtB8k8o
	q8a92dCIhVUI3LkjA+UlAia110DSLRtCWfym5nZCHdjYjcZCIdocR1loKPE1IR3D7kJ6
	s7+A==
X-Gm-Message-State: ABuFfoii+2dO6OfuwZK7IawWebmYclzjGOLUZ5fhAVUztISynJs18tZk
	Ll4LDb+mOVxeXSRpFFRH/Ro=
X-Google-Smtp-Source: ACcGV63To8cfmNx2Ns7lfdWrT/AH2EAOg6Zr/Y52Y/V+7wBGV/wnV1R9KeAmVWN7Fq1hth3/OsU+9Q==
X-Received: by 2002:adf:ae41:: with SMTP id
	u1-v6mr23964516wrd.43.1539210590199; 
	Wed, 10 Oct 2018 15:29:50 -0700 (PDT)
Received: from x1.local (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	c64-v6sm13787447wma.44.2018.10.10.15.29.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:29:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Reimar=20D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 11 Oct 2018 00:29:43 +0200
Message-Id: <20181010222944.29304-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010222944.29304-1-f4bug@amsat.org>
References: <20181010222944.29304-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_1/2=5D_mailmap=3A_Fix_Reimar_D?=
 =?utf-8?q?=C3=B6ffinger_name?=
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
X-List-Received-Date: Wed, 10 Oct 2018 22:29:58 -0000

This probably happened when interpreting the utf8 name as latin1.

Fixes dbbaaff6867 and f4e94dfefb6.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 2c2b9b1205..6f2ff22a45 100644
--- a/.mailmap
+++ b/.mailmap
@@ -33,5 +33,6 @@ Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu
 
 
 # Also list preferred name forms where people have changed their
-# git author config
+# git author config, or having utf8/latin1 encoding issues.
 Daniel P. Berrangé <berrange@redhat.com>
+Reimar Döffinger <Reimar.Doeffinger@gmx.de>
-- 
2.19.1


