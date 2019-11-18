Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWd66-0001KP-Tv
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 04:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iWd64-0001I4-Tf
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:13:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iWd63-0002N2-Sp
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:13:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49445
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iWd63-0002Mk-Pl
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 04:13:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574068403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SXqocHGGObICQ0noNgGOSAzBTIvED8fRj2EMrEWyXg=;
 b=i42A9j7F5bP+GctJ67Xmm4hOLPPDfn7UjsBaaUNZg9F4uiL9leVXjv50Fkyk7hdKDdGi+j
 E2TsrYEZ03vzFjeq/TGqU79JkAv32GzYaCLnaJ4GMChnCOd9mHsefDKyJkIfkeWMdoowV1
 o9NN6pOo9B6qOvJpfnf7tR4eot09ydQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-BbM8Zn0nNXmZ9F_Wp-UfGA-1; Mon, 18 Nov 2019 04:13:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C9880268A;
 Mon, 18 Nov 2019 09:13:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-97.ams2.redhat.com
 [10.36.116.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9767760856;
 Mon, 18 Nov 2019 09:13:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4300C1138648; Mon, 18 Nov 2019 10:13:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] buildfix: update texinfo menu
References: <20191023101956.19120-1-kraxel@redhat.com>
 <ba8b74e7-8c37-dc76-a77e-33448b698777@redhat.com>
Date: Mon, 18 Nov 2019 10:13:15 +0100
In-Reply-To: <ba8b74e7-8c37-dc76-a77e-33448b698777@redhat.com> (Laszlo Ersek's
 message of "Sat, 16 Nov 2019 20:12:34 +0100")
Message-ID: <87blt9y2c4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BbM8Zn0nNXmZ9F_Wp-UfGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 18 Nov 2019 09:13:26 -0000

Laszlo Ersek <lersek@redhat.com> writes:

> On 10/23/19 12:19, Gerd Hoffmann wrote:
>> Build error message:
>> qemu-doc.texi:34: node `Top' lacks menu item for `Recently removed featu=
res' despite being its Up target
>>=20
>> Fixes: 3264ffced3d0 ("dirty-bitmaps: remove deprecated autoload paramete=
r")
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  qemu-doc.texi | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/qemu-doc.texi b/qemu-doc.texi
>> index 3c5022050f0f..3ddf5c0a6865 100644
>> --- a/qemu-doc.texi
>> +++ b/qemu-doc.texi
>> @@ -44,6 +44,7 @@
>>  * Security::
>>  * Implementation notes::
>>  * Deprecated features::
>> +* Recently removed features::
>>  * Supported build platforms::
>>  * License::
>>  * Index::
>>=20
>
> Can this patch be included in v4.2.0-rc2 please?

Cc'ing qemu-trivial again, might be a workable path into -rc2.


