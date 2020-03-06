Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAGPN-0007rQ-2f
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 12:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jAGPJ-0007nQ-2N
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 12:05:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jAGPH-0003bA-1n
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 12:05:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jAGPG-0003Qf-Te
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 12:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583514301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U7q74TWjNxbK3tgaQhfZm3ANvml13ZWcKrxUUIs/sbw=;
 b=Ng0K1chSyBcwk09cw1ZRpJHKLHcLIZtggb6YIZ6Gq3aCzico712FEpRbgRkX+DazUcQ3yT
 q4aOE8Etpfz7Nxv9X6LA5YZ0upuqJF278sZaNvFfCUB0gSqpb5us0+fa2LleUQGasop6qc
 /FMPlzUUmwgk+8DHCitzuD4O1VDSIJI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-q6_K3a4HOSGeoB1U6ep3CA-1; Fri, 06 Mar 2020 12:05:00 -0500
X-MC-Unique: q6_K3a4HOSGeoB1U6ep3CA-1
Received: by mail-wr1-f71.google.com with SMTP id m18so1259293wro.22
 for <qemu-trivial@nongnu.org>; Fri, 06 Mar 2020 09:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUFkzbxwIS11JDtiX5wUGCyWlbLosGGXt1JlvCGY4bk=;
 b=feoIOvjrbkxDLVJ3JsoKF4g9ffGyd8oesCs3JenPvrEr/9Ezq2iDswcjl1gXoiEBrF
 9BVd3qIkaRnwoYJ4di+41L3vTz10rJpYtZZ0N48aF1eW2MFsVkUpVXd8croHMU6GtAQY
 BryuWLiem5BUayGTtzZRXbrA+TC/NwrSfxjXpaJ7a39xkBweIziR4UwcjKtHh05i+MCv
 9orGeqv2p7IQpInGbKHxq5127JK29x4UdYFpwy/M6cEPLJg0ht2tRKq1+i+4kyrZrjfD
 TzUNlCt2vTB1czX95sA116T7jouP1MMTsyHb3E8z//XaI+teEU+BDFiq2xGwL//u+g6W
 H3NA==
X-Gm-Message-State: ANhLgQ3OPW78A5mlqLlch4V9r79YFkJmQ/zLqQLrhviyzOYycFTnevvq
 ett/bZ10jj02refB/0DXd3Nt5tNGCFsE/WxEl40YSNB42+7pPdnEKz9RtuqdyLAywajpaN65Ti2
 YvYlxlTrdcLpTKwylJw==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr4831276wmj.20.1583514298832; 
 Fri, 06 Mar 2020 09:04:58 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu6ZNSeF8kQAc+YfafxzT8Sk+vbnPk5Q1SHK1g5C8huyoO03WALrQ69c9dXP8FT4sCBTf8s1g==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr4831255wmj.20.1583514298481; 
 Fri, 06 Mar 2020 09:04:58 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id h17sm50791695wro.52.2020.03.06.09.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 09:04:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] build-sys: Move the print-variable rule to rules.mak
Date: Fri,  6 Mar 2020 18:04:56 +0100
Message-Id: <20200306170456.21977-1-philmd@redhat.com>
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
X-List-Received-Date: Fri, 06 Mar 2020 17:05:06 -0000

Currently the print-variable rule can only be used in the
root directory:

  $ make print-vhost-user-json-y
  vhost-user-json-y=3D contrib/vhost-user-gpu/50-qemu-gpu.json tools/virtio=
fsd/50-qemu-virtiofsd.json

  $ make -C i386-softmmu print-obj-y
  make: Entering directory 'build/i386-softmmu'
  make: *** No rule to make target 'print-obj-y'.  Stop.
  make: Leaving directory 'build/i386-softmmu'

Move it to rules.mak so we can use it from other directories:

  $ make -C i386-softmmu print-obj-y
  make: Entering directory 'build/i386-softmmu'
  obj-y=3Dqapi-introspect.o qapi-types-machine-target.o qapi-types-misc-tar=
get.o qapi-types.o qapi-visit-machine-target.o qapi-visit-misc-target.o qap=
i-visit.o qapi-events-machine-target.o qapi-events-misc-target.o qapi-event=
s.o qapi-commands-machine-target.o qapi-commands-misc-target.o qapi-command=
s.o qapi-init-commands.o
  make: Leaving directory 'build/i386-softmmu'

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile  | 3 ---
 rules.mak | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9d4b224126..fdc5d29bb9 100644
--- a/Makefile
+++ b/Makefile
@@ -15,9 +15,6 @@ UNCHECKED_GOALS :=3D %clean TAGS cscope ctags dist \
     help check-help print-% \
     docker docker-% vm-help vm-test vm-build-%
=20
-print-%:
-=09@echo '$*=3D$($*)'
-
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
 # Put the all: rule here so that config-host.mak can contain dependencies.
diff --git a/rules.mak b/rules.mak
index e39b073d46..694865b63e 100644
--- a/rules.mak
+++ b/rules.mak
@@ -435,3 +435,6 @@ sentinel =3D .$(subst $(SPACE),_,$(subst /,_,$1)).senti=
nel.
 atomic =3D $(eval $1: $(call sentinel,$1) ; @:) \
          $(call sentinel,$1) : $2 ; @touch $$@ \
          $(foreach t,$1,$(if $(wildcard $t),,$(shell rm -f $(call sentinel=
,$1))))
+
+print-%:
+=09@echo '$*=3D$($*)'
--=20
2.21.1


