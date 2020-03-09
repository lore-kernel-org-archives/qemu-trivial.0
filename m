Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBKmW-0006EZ-VK
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42807)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBKmU-00069w-Au
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBKmT-0000eD-3p
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:57:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60759
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBKmS-0000dN-VC
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583769444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sM6wzIxkfI44re0KY8Dat2S2LMsIRmYZXOzMvLj+MvU=;
 b=X48UBZtHac9MDR1ljNxJ95mYsNxZ+GPrsbHwzh9+NbLsa3NxLrhB7bIwGcuGBKEysJj/XS
 glVaZL9E4EqeKmORL+ZJQyhfePeDqs9Cj4SF8t/Ol8SHcU2b75rSGiwSR+hxQ98R7/PUnk
 aI0iF4gQQm4qWO/LzN7eHA1H+WJA1lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-F7tyqmS2M5-8vcEfcsYSRA-1; Mon, 09 Mar 2020 11:57:22 -0400
X-MC-Unique: F7tyqmS2M5-8vcEfcsYSRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7645D18C35B2;
 Mon,  9 Mar 2020 15:57:20 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-162.ams2.redhat.com [10.36.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244205C557;
 Mon,  9 Mar 2020 15:57:14 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:57:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, "open list:Sheepdog" <sheepdog@lists.wpkg.org>,
 qemu-block@nongnu.org, libvir-list@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, mreitz@redhat.com,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Liu Yuan <namei.unix@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 1/4] block: Add trivial backing_fmt support to qcow,
 sheepdog, vmdk
Message-ID: <20200309155713.GE6478@linux.fritz.box>
References: <20200306225121.3199279-1-eblake@redhat.com>
 <20200306225121.3199279-2-eblake@redhat.com>
 <20200309152112.GC6478@linux.fritz.box>
 <7b7f12f8-ca03-12d4-b93d-2edefb51cb42@redhat.com>
 <20200309154412.GL3033513@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200309154412.GL3033513@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-List-Received-Date: Mon, 09 Mar 2020 15:57:27 -0000

Am 09.03.2020 um 16:44 hat Daniel P. Berrang=E9 geschrieben:
> We could support "-F ..." and validate any non-raw formats, while raising=
 a
> runtime error in the case of "-F raw", as only the "raw" backing format h=
as
> the probing security risk.
>=20
> Users who need  to use qcow, with a backing file, without a format can
> just not pass "-F" and in doing so will be insecure.

Hm, this is actually an interesting option. We wouldn't lose features
compared to today without -F, but we would allow -F when we can verify
that the operation is safe (the image is already non-raw).

> We could take this opportunity to deprecate 'qcow' perhaps, declare it
> a read-only format, restricted to qemu-img/qemu-io for purpose of data
> liberation ?

I'm against making any format read-only because that immediately means
that it becomes untestable.

> For sheepdog, if it is something we genuinely still care about, then
> adding a backing file format record seems neccessary, unless we either
> forbid use of raw backing files, or forbid use of non-raw backing files,
> either way would be safe.

In case of doubt, we can use the same logic as you suggested for qcow
(accept only non-raw with -F, but no restrictions without -F).

Kevin


