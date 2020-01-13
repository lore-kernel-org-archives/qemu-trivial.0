Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ir1RA-0001t5-Tk
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jan 2020 10:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ir1R8-0001qy-BI
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:15:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ir1R6-00071J-4B
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:15:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25511
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ir1R5-0006zd-Vw
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 10:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578928523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqriSNUO6aoz+7hgMesSJlUQr2cOnjev1lmGFCpQusY=;
 b=P2jXEkoQMAvzRsMuy0E5sjn85g3qGhDHMz48AltUOxeLD0gL0myI+ZtuW9AAdrUQfR3Nn0
 7wFuE9gPEiY+Vb3+SMwjVEnCRvcf+hJfSqH22qKijIBoj957ko9sgOI92UHQbJ5VACztCU
 ti77WnEXCmp7N0h6/Auprc/VTYWSpN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-vUnIroHDPYmEUrtoHhI_jQ-1; Mon, 13 Jan 2020 10:15:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D5A107ACC5;
 Mon, 13 Jan 2020 15:15:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CFCF60BF1;
 Mon, 13 Jan 2020 15:15:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 901DC1138600; Mon, 13 Jan 2020 16:15:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 12/59] virtfs-proxy-helper.c: remove 'err_out' label in
 setugid()
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-13-danielhb413@gmail.com>
 <20200107105113.7a443d51@bahia.lan>
Date: Mon, 13 Jan 2020 16:15:16 +0100
In-Reply-To: <20200107105113.7a443d51@bahia.lan> (Greg Kurz's message of "Tue, 
 7 Jan 2020 10:51:13 +0100")
Message-ID: <87wo9vxu9n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vUnIroHDPYmEUrtoHhI_jQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
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
X-List-Received-Date: Mon, 13 Jan 2020 15:15:27 -0000

Greg Kurz <groug@kaod.org> writes:

> On Mon,  6 Jan 2020 15:23:38 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>
>> 'err_out' can be removed and be replaced by 'return -errno'
>> in its only instance in the function.
>>=20
>> CC: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>
> I don't really mind, but I confirm this doesn't change behavior.
>
> Acked-by: Greg Kurz <groug@kaod.org>
>
> What's the plan to get this and the other 9p related patches merged ?
> Through the trivial tree or each subsystem tree ?

I guess qemu-trivial will eventually pick up whatever hasn't been merged
by maintainers.

[...]


