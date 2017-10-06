Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOP-0006u6-6C
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:50:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOM-0006rH-QN
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOM-0004ls-15
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:54 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:52752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOC-0004hA-Eg; Fri, 06 Oct 2017 19:50:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id o52so34320322qtc.9;
	Fri, 06 Oct 2017 16:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=o1k2lCuaN0rpkGsOAU0W+x1++CfwLSSCaXE7Vnh7mlI=;
	b=De6T2Au4tvXQqEmdlrvEw2tSa4vb7O7gnYK5zYhZBzwOrIjk+yYNxUDWSwCg1Kot4S
	ieJiUjhjRe3pVihkgb/MJLqaUAnm8fVDRa+LRJEpBMccONpzwKyZyCXz4v+zRPhUu4ld
	Zx0c31BMo83z5MdG/9Urjn9jzVEjf76cInZuuj9zvaAK+aLa/rRBlVoFmkurVweoaZC+
	oSfWHaF0HsNwMp2xubcwJbJocGuQ3tFVx/NUQxL1/YHFOyqP4+8GZ4o+pH3lvLuolvFM
	Y0mNYe/bhAPdf5aR8ktFRIY3YaV8T2Yf5ObRWe1WSmKth6OwzzbmvYfylxMlPnwM1AjD
	1qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=o1k2lCuaN0rpkGsOAU0W+x1++CfwLSSCaXE7Vnh7mlI=;
	b=hyAsPp4TFizSRYJe5fJ+CIoY4AUtYBkj74ovt7N165bEGF3V8tyARYlRBi0r0qnFCi
	f14Sl3xG8aK91j3PmjXKeODnu0QtFhkUBzRa/OcyDKp4Ue6w90eMCj78KErWvLoSUiBs
	Gtu1vGgxJez4TcwWnqR4sA2oFssr5IzNJwEFIp9TKP3ZIq5vArxnR+FrbsFayq7vNFTz
	TBx3aG4ZukyRBCFpNzOVXbPXpcFpp6RmM1Mvw794u/VQtrkVFDL4bgAU+hIKDBiBO4rF
	/FlStE1XEcs42X0om2E+o10qwT0wnPSyyk76FwaMdhGETM+7dHDMMYw2+8CrAs417eCY
	ZV2w==
X-Gm-Message-State: AMCzsaVYRrM3szdnQMUPgD7TeCN+s2xhmUJeOGE5uplgB1l58GOTnA24
	yHJjZfReZzbx3h8dGaIWhDU=
X-Google-Smtp-Source: AOwi7QBBmqpiWrCTKNUJq2IU0alZowlZkmwPPje9dDmHRfyvK6lka2QHqLU7YHQR9B+F5DA8rbQTvg==
X-Received: by 10.200.8.109 with SMTP id x42mr5772420qth.54.1507333843863;
	Fri, 06 Oct 2017 16:50:43 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:48:58 -0300
Message-Id: <20171006235023.11952-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 03/88] cocci: extract typeof() from g_new()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:50:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/g_new.cocci | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
index c767325a21..368f0c5651 100644
--- a/scripts/coccinelle/g_new.cocci
+++ b/scripts/coccinelle/g_new.cocci
@@ -118,6 +118,15 @@ T *m;
 +m = g_try_new0(T, 1);
 )
 
+@@
+type T;
+identifier m;
+@@
+T **m;
+...
+- *m = g_malloc0(sizeof(**m));
++ *m = g_new0(T *, 1);
+
 ////////////////////////////////////////
 //
 // last transformations: cleanups
-- 
2.14.2


