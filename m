Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdyXq-0006z1-AO
	for mharc-qemu-trivial@gnu.org; Wed, 27 May 2020 12:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jdyXp-0006yl-Da
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 12:04:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24754
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jdyXo-0003rN-3L
 for qemu-trivial@nongnu.org; Wed, 27 May 2020 12:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590595478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXsOpc+LwdaqTTLwjl0My7FDo7HqGubUkmkQxSsTZRI=;
 b=QbW23dottD4aRd+iOx2RKZIlcDQfXlsktU3Nn4OKNmeFIO4qNDOJVFWu0VILq/nE9+DvDg
 33QNsGFHaidHlEy3NyMBI7c23CT5HmvBIxgToRStMdqjD1Nuty3QTpNCug8MwoX+lQV4nU
 PH/HFp3ydEbTPusidxweHMpQV24JyHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-faAs_DmMNLm1Z8Bw9tdC6Q-1; Wed, 27 May 2020 12:04:36 -0400
X-MC-Unique: faAs_DmMNLm1Z8Bw9tdC6Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A657318A0732;
 Wed, 27 May 2020 16:04:35 +0000 (UTC)
Received: from gondolin (ovpn-114-205.ams2.redhat.com [10.36.114.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27F691001925;
 Wed, 27 May 2020 16:04:25 +0000 (UTC)
Date: Wed, 27 May 2020 18:04:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-trivial@nongnu.org, Eric Auger
 <eric.auger@redhat.com>
Subject: Re: [PATCH v2] hw/vfio/common: Trace in which mode an IOMMU is opened
Message-ID: <20200527180423.7f226442.cohuck@redhat.com>
In-Reply-To: <20200527155555.6833-1-philmd@redhat.com>
References: <20200527155555.6833-1-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:45:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 16:04:41 -0000

On Wed, 27 May 2020 17:55:55 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> One might want to check which IOMMU version the host kernel
> provide. Add a trace event to see in which mode we opened
> our container.
>=20
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Only display string description (Eric)

Also fine with me.

>=20
> Supersedes: <20200526173542.28710-1-philmd@redhat.com>
> ---
>  hw/vfio/common.c     | 19 ++++++++++++++-----
>  hw/vfio/trace-events |  1 +
>  2 files changed, 15 insertions(+), 5 deletions(-)


