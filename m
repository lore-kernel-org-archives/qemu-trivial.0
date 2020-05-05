Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVtgD-0007D2-FV
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2020 05:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jVtgC-0007Bw-9J
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 05:15:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46238
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jVtg2-00022L-Qn
 for qemu-trivial@nongnu.org; Tue, 05 May 2020 05:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588670144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okxyS+7StYMGmF5fIDP4QbjnN153iBH2OplGw8ScCMY=;
 b=b2YhYFM8eKzcAWLnStszRMhw5473eiyc77JPC8gMRsz9Ckm2okdwBsk9ZoUFj/kwC+Ckzf
 vg9zx4tAQYxUyokrDyLjwDnAsXtTua2DvVlt3Tk/6d/oEfOCsEJP44202xmyqO7bMjFLQ7
 G5wXJqhWnRCpJXbjfHuFx/hKjnPaNxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-FauiMTmNOG2kbnhTL2eHZg-1; Tue, 05 May 2020 05:15:40 -0400
X-MC-Unique: FauiMTmNOG2kbnhTL2eHZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 144C8800D24;
 Tue,  5 May 2020 09:15:39 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70955D9D3;
 Tue,  5 May 2020 09:15:36 +0000 (UTC)
Date: Tue, 5 May 2020 10:15:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 zhang.zhanghailiang@huawei.com, Euler Robot <euler.robot@huawei.com>
Subject: Re: [PATCH v2] crypto: Redundant type conversion for AES_KEY pointer
Message-ID: <20200505091533.GD764268@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200505085940.28592-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200505085940.28592-1-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 05 May 2020 09:15:56 -0000

On Tue, May 05, 2020 at 04:59:40PM +0800, Chen Qun wrote:
> We can delete the redundant type conversion if
> we set the the AES_KEY parameter with 'const' in
> qcrypto_cipher_aes_ecb_(en|de)crypt() function.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> v1->v2:
> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
>=20
> Modify the AES_KEY parameter with 'const' in
> qcrypto_cipher_aes_ecb_(en|de)crypt() methods.
> (Base on Daniel P. Berrang=C3=A9's suggestion)
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00515.html
>=20
> ---
>  crypto/cipher-builtin.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

and queued - will send a PR with this and some other crypto fixes later
today most likely.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


