Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbN55-0000ZI-ST
	for mharc-qemu-trivial@gnu.org; Fri, 15 Oct 2021 09:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN54-0000Wb-IA
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 09:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN51-0001w3-KC
 for qemu-trivial@nongnu.org; Fri, 15 Oct 2021 09:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uecXco96/ObZcTQeRxj2uCDZJSTrwGiv6+zy10RVhZI=;
 b=I7Hq0Y6iCKb1ND+orLqfvajQqLUUzLY3WK+Y6OwClFVUR8K+USZ8r3JW0MIO8wizrFLlg+
 f4Q16mMvfrIdSGa8XzKEtDyfDzW/ZxR32BvoW416n9+2DgPAudrShUuRSv5073Buj3WZ2g
 9KrTIGyNYaBHMceWLESqgWqx22+QUkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-K4xsmcI1OnO_MeuUc28TrA-1; Fri, 15 Oct 2021 09:16:54 -0400
X-MC-Unique: K4xsmcI1OnO_MeuUc28TrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4DAA10A8E00;
 Fri, 15 Oct 2021 13:16:53 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB9A260C13;
 Fri, 15 Oct 2021 13:16:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 0/2] analyze-migration.py: trivial fixes
Date: Fri, 15 Oct 2021 15:16:43 +0200
Message-Id: <20211015131645.501281-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 13:17:02 -0000

This script is not used a lot but it helps to debug migration,=0D
so it's annoying when we need it and it doesn't work...=0D
=0D
The first patch fix an error message that is erroneous and thus=0D
doesn't help at all.=0D
=0D
The second fixes a problem introduced by python3 and preventing=0D
to run the extract mode.=0D
=0D
Laurent Vivier (2):=0D
  analyze-migration.py: fix a long standing typo=0D
  analyze-migration.py: fix extract contents ('-x') errors=0D
=0D
 scripts/analyze-migration.py | 6 +++---=0D
 1 file changed, 3 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


