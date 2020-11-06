Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb59v-00032v-HL
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 12:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59u-00031U-Bb
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59s-0001z3-Dn
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604682254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7AwrTJUuq41/XCYK+7UGABhog2BUpWFpH3S0s5kN6W4=;
 b=Ea7LyksDVn+feaigZBSoYv+m6dKijpnNroOGkMh2MykrM718ifXeOLI5MLWxquEDMOpRBt
 0RUQIeZOttfGhuDSzqQE/t8pVM1a/t5eNYkwRnfWTltAWDXkb094TwGaliR14jhh4PmyiY
 EO7Nus4Bv1PQ72O50LpP+22Anug5JA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-o-FvH19EO6CdADuRXeWP9w-1; Fri, 06 Nov 2020 12:04:13 -0500
X-MC-Unique: o-FvH19EO6CdADuRXeWP9w-1
Received: by mail-wr1-f72.google.com with SMTP id x16so691683wrg.7
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 09:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbJkJ95FxPswVXG1ztV9sKjvQN1FMmoVTHeFp9snjqk=;
 b=WxuDmdTwRHlfEYhdFsAof5SyRsc1MTdEF2K22K6w4hod13+IxTajUTyX/OsrFbCoWS
 gkncLMudg4BC8KoaBUm11yXuHrcWGlP9iDkAOTolvl7mG3oVYSxcTcJp1WvsYUWZN4+x
 ftCDxURu+OlvGXzJb1gvuQFr1VOmgdNfp3Bw34ApPcqvnwINFifMOgIksau/l1zBA/z6
 CPs/P5KyrQIeVqRjmPrnQwUPZ9gbAag1WS8TaQ/WomhPsEw3FSQzpe6CMBlHqIOO4DJd
 DBc7kvsy5udd8Deht6umsQzfVHx7jtZXzskPo5z1DtfOZ0R6bYcvyVYtPX14zGV4+Hkv
 iuxw==
X-Gm-Message-State: AOAM531Sc1zg11j2Pb/6/0QQRYQU5bvmj9LahZ69TFNEcM4MCzQA82Ig
 EpemjZy52ELQ95HaK3tAkdxyVPXa8SysTls96QF1ilXHOlCxSR1ZxPAqFSUwWcQyrjjPo5kKDeN
 b0PE+yBLTW7Vpf0BBmw==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr3601460wre.22.1604682251956; 
 Fri, 06 Nov 2020 09:04:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxin7zoiwQLwLc3jCv5l0D02DkvnSTIhhmFvlfsktMjWYTB3ZNEmt6ZOI0/EiwBz+uwgafbFA==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr3601421wre.22.1604682251640; 
 Fri, 06 Nov 2020 09:04:11 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t15sm3099502wmn.19.2020.11.06.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 09:04:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-6.0 0/2] hw/scsi/scsi-disk: QOM style change
Date: Fri,  6 Nov 2020 18:04:02 +0100
Message-Id: <20201106170404.4130486-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 06 Nov 2020 17:04:18 -0000

Some QOM style changes in TYPE_SCSI_DISK to follow=0D
the rest of the codebase style. No logical change.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/scsi/scsi-disk: Rename type as TYPE_SCSI_DISK=0D
  hw/scsi/scsi-disk: Use SCSI_DISK_GET_CLASS() macro=0D
=0D
 hw/scsi/scsi-disk.c | 26 +++++++++++++-------------=0D
 1 file changed, 13 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


