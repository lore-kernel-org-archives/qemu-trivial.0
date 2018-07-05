Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6eM-0004Ky-RA
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eJ-0004In-UC
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eI-000521-PM
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:28 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:35281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eI-00051s-KB; Thu, 05 Jul 2018 11:58:26 -0400
Received: by mail-qt0-x22d.google.com with SMTP id z6-v6so7513628qti.2;
	Thu, 05 Jul 2018 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=00SURX0XKAYYhsSYBH6d77B3Khg8QXH5uebFrf+PcyU=;
	b=RNoUBaUCQLG7kKrKdBORCc1HZKuHuGaNxj2ndLsKnhqNx6gUXf7S46B+G5k5CCyYxW
	QvhfiUHgP3LEaaZgY8a7FHBIpd9pHZ1/nZ41hVCh+hnVQi9X1p2DEYjCbBZATvgd+w5z
	XIrEyCRjWrr7rPXQRXNuReaRHHWuQ4WsGxFm7MLOvkW1M4rW3b68si1D1uPszWTemtk+
	kBuxZ3zUiI5Ui5OaKz704Ujku5pwFxL88tq63h9PxIqVNgP6f1xKRb7mom5/z/Nj9Z1F
	rDijnrlhfMkjromMMRZoeiS86CpaGmcwOfF1Sa0QfYDX2SfR8H/RNddB58YDkgXL7UQP
	s9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=00SURX0XKAYYhsSYBH6d77B3Khg8QXH5uebFrf+PcyU=;
	b=UBeakNbtGkJ8wu+ch+nrnuSqqMtZ4Y1+H/zysmpxy8XeUMQi4wjU4xguIOwtCcmCa7
	6ZkG9KQm4zwLcSdLyHDDBMcTugqTlt/i1cTg3Oyu794VHoOIPQecclKUpEmNJzbhR3H7
	DF8sU9BPWRo4yAj2HqCYCvmx0/VgEmK+ZyUou5xoFR0e2wC6nMd8kg/6B8j9TVaHbaf2
	3F/7B3P4ZgRutQAB+iZY9dyVIShDDtodfAQ26u4kcFXQZqq6/ACWvmyumOaN3XrfRq5g
	Wk+KRbBXtkEld7qiZ09ArkKmst5CclCW/t0bCGgnyEqEd3Sa+oO42pzu3FRcZ4RDQcvo
	6/+A==
X-Gm-Message-State: APt69E0nS7IBH065RFH5kgIKGujWKvRsnegfEv0UWy4SxtFcEMOnpWpX
	VyCuGrd2c3niAipLlRrgVqpkqnwP
X-Google-Smtp-Source: AAOMgpdsybTkIhwGa9G3PFQy7fxVoE+/mbUBNvNqzeqgynLDyxSXbpM7EldkmtnFNHUz5EwhuO2bww==
X-Received: by 2002:ac8:322:: with SMTP id
	q34-v6mr5979294qtg.342.1530806305847; 
	Thu, 05 Jul 2018 08:58:25 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Thu,  5 Jul 2018 12:58:05 -0300
Message-Id: <20180705155811.20366-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-trivial] [PATCH v2 1/7] qobject: Catch another straggler for
 use of qdict_put_str()
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:29 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/qobject.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 qobject/block-qdict.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
index 80c653013f..ae363708ab 100644
--- a/qobject/block-qdict.c
+++ b/qobject/block-qdict.c
@@ -572,7 +572,7 @@ static QObject *qdict_crumple_for_keyval_qiv(QDict *src, Error **errp)
         if (!tmp) {
             tmp = qdict_clone_shallow(src);
         }
-        qdict_put(tmp, ent->key, qstring_from_str(s));
+        qdict_put_str(tmp, ent->key, s);
         g_free(buf);
     }
 
-- 
2.18.0


