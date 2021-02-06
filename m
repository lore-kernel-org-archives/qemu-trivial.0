Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8Msp-0005tA-18
	for mharc-qemu-trivial@gnu.org; Sat, 06 Feb 2021 07:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l8Msk-0005s1-Gw
 for qemu-trivial@nongnu.org; Sat, 06 Feb 2021 07:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l8Msg-0003rq-Ob
 for qemu-trivial@nongnu.org; Sat, 06 Feb 2021 07:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612615203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pJSyMseVXyjaoF1dEZOiUQih8aQMFgkpLmXdN4A0QA4=;
 b=Qxr3JFG95C6OgbtVLvxqycf6HmzzmBcXyDHey5U1qHrD7AirvOlmMgYsTpVYp3qqFoC1vs
 Ymdo1JPMyfDCp1LLEvskyPcMWWzg/3gQ8Un+pNOxlWSQ6tkSo2o42IOUxawdjkODDMHHI3
 XQ/DeI3wX5Vl6nmTtCZgkZYY0Qhumss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-TmfOaDdzN7CvFFCSNZ4lXw-1; Sat, 06 Feb 2021 07:40:01 -0500
X-MC-Unique: TmfOaDdzN7CvFFCSNZ4lXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A59801976;
 Sat,  6 Feb 2021 12:40:00 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66F7D5D9D2;
 Sat,  6 Feb 2021 12:39:56 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, jfreimann@redhat.com
Subject: [PATCH 0/2] failover: trivial cleanup and fix
Date: Sat,  6 Feb 2021 13:39:53 +0100
Message-Id: <20210206123955.2196514-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.353,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Sat, 06 Feb 2021 12:40:11 -0000

The first patch removes a duplicate assignment to allow_unplug_during_migra=
ti=3D=0D
on,=0D
and simplify the code.=0D
=0D
The second patch fixes a dangling object in failover_add_primary() that pre=
ve=3D=0D
nts=0D
to cleanup the internal structure after the object has been unplugged.=0D
=0D
Laurent Vivier (2):=0D
  pci: cleanup failover sanity check=0D
  virtio-net: add missing object_unref()=0D
=0D
 hw/net/virtio-net.c | 2 ++=0D
 hw/pci/pci.c        | 6 ++----=0D
 2 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


