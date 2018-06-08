Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRMeB-0001cB-6x
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 15:02:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMe9-0001Z4-90
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 15:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMe8-0006vF-GZ
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 15:02:01 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:44673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRMe1-0006t2-UT; Fri, 08 Jun 2018 15:01:54 -0400
Received: by mail-qk0-x22e.google.com with SMTP id 185-v6so9385168qkk.11;
	Fri, 08 Jun 2018 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8OncvPbgneLxIAJkDPn5/1pLMBgIcVGfYLNNW7yDs5w=;
	b=S1eLsWGFUNapRDRHmvZwWJMjV7c1alvvDy6VzcSN+RowyTdQDC/bN8GvUf1H0nmGiJ
	uZ79jntekCyFNeCgiWVXZQesfISESTGabn7pTizTKsf/yiCdMGI78kNwIkLW7BCaemm2
	y+jTDRDfy/4YCA7yM3fVGtVrfyDR3ZL9gBbDyJpUR53ZuVNWntZE9vf/BeD6dNTMrIIN
	bB6QXbUhxvg1CqcbwfeF4er2Z8tJrfHRH3S/z9I1la/HvsKXKRwTKi+F64cv3otGseRr
	iqzp2+6VzhT8pEXq9iyRGD2hX+DZB4UnkKs3PKqBd4JogI+3hzoQq4qsf10njteGemie
	/TFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=8OncvPbgneLxIAJkDPn5/1pLMBgIcVGfYLNNW7yDs5w=;
	b=WwRyj4vrJv1lILkR8Or6gwGu3W/5GkeCAkVq/+cSdbPw7d/fpjASIsyoHrEtS15EvV
	wScUunLQ2/5adVJjgH2HjJYL8eTByP6dQTJOM8naa1K5384Q063pz+uwnn9kjCVG4JqG
	fLCzeRg/KO96059iGuSZMkpusEyr31tN+QD54O5f53W3ZSdr7JOyJDB5GCKy+is1ASXM
	BC2/Y0tN1sBUYZJ83jARN6uam55KbRNzss5eZNnDNUyvsaHZ+YwWgcUcadxZX7ExhUKD
	7xrMG1u9c9CQXjmOAab3xbkO5nz/DtqL+VGtVtWGR5OwR5O74KVUOvUK9GAMT9ySoIH0
	Kl5A==
X-Gm-Message-State: APt69E1w7ZkzvGaQ53eVVAF5BvepPektoK07t2Zc9tiXeQF7QT2N17jf
	fwdqqnIfs5QApdyX+zs0rf8=
X-Google-Smtp-Source: ADUXVKI8gEqbDGmBquI1spqly0Y+KTuWpwT7dZuufnAmvGkea+QiaMTXgFk78tA8vd59MPlwEmlcuw==
X-Received: by 2002:a37:668c:: with SMTP id
	a134-v6mr6322156qkc.7.1528484513326; 
	Fri, 08 Jun 2018 12:01:53 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	n11-v6sm34322612qki.76.2018.06.08.12.01.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 12:01:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
Date: Fri,  8 Jun 2018 16:01:45 -0300
Message-Id: <20180608190145.10872-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: [Qemu-trivial] [PATCH RESEND] Makefile: Remove qemu-version.h and
 qemu-options.def during 'make distclean'
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
X-List-Received-Date: Fri, 08 Jun 2018 19:02:02 -0000

qemu-version.h and qemu-options.def are generated files
that should be deleted during 'make distclean'.

This solves building issues with out-of-tree builds from
a source tree that has been built in (see d1bd2423a90):

- /qemu-version.h existing in source tree:

    /source/qemu/qemu-nbd.c: In function ‘version’:
    /source/qemu/qemu-nbd.c:133:6: error: expected ‘)’ before
    ‘QEMU_FULL_VERSION’
     "%s " QEMU_FULL_VERSION "\n"
          ^~~~~~~~~~~~~~~~~~
          )
    /source/qemu/qemu-nbd.c:133:3: error: format ‘%s’ expects a matching
    ‘char *’ argument [-Werror=format=]
     "%s " QEMU_FULL_VERSION "\n"
      ~^
    cc1: all warnings being treated as errors

- /qemu-options.def existing in source tree:

    /source/qemu/vl.c: In function ‘main’:
    /source/qemu/vl.c:3052:18: error: ‘QEMU_OPTION_blockdev’ undeclared
    (first use in this function); did you mean ‘QEMU_OPTION_clock’?
                 case QEMU_OPTION_blockdev:
                      ^~~~~~~~~~~~~~~~~~~~
                      QEMU_OPTION_clock
    /source/qemu/vl.c:3052:18: note: each undeclared identifier is reported
    only once for each function it appears in

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
resend: Cc Peter, removed dup line in comment

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 023b3437ec..7ae453ffa2 100644
--- a/Makefile
+++ b/Makefile
@@ -757,6 +757,7 @@ qemu-%.tar.bz2:
 distclean: clean
 	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi qemu-monitor-info.texi
 	rm -f config-all-devices.mak config-all-disas.mak config.status
+	rm -f qemu-version.h qemu-options.def
 	rm -f po/*.mo tests/qemu-iotests/common.env
 	rm -f roms/seabios/config.mak roms/vgabios/config.mak
 	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps
-- 
2.17.1


