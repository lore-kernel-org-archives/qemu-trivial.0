Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kagRe-0005uC-41
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 09:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kagRb-0005tn-Lv
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 09:40:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kagRY-0000B0-SY
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 09:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604587250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46b2Ln5T4yfP7ivtlpaxogrQmmY6KWusok8TKCkzq8Q=;
 b=SKwecdwaEoxIFbMSEPOvbZb8pR/h+HlzebJff9fYa+XyJFho1DJcuVKELbTpvnegJRy4s5
 CQe0/i9XS4VkeZyxsDlR6d4kIBBfCwPJFrxK5OQPxOjsOU/+B9hY0cX7+7fZuHmfwkg+oz
 7RCP/lBup19ltBqkCdbe6xSR5oo+NH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-N6894LTWMuG2XPI0plPxgQ-1; Thu, 05 Nov 2020 09:40:45 -0500
X-MC-Unique: N6894LTWMuG2XPI0plPxgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 774DA8DF0C4;
 Thu,  5 Nov 2020 14:40:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6051002C28;
 Thu,  5 Nov 2020 14:40:40 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] block: enable libnfs on msys2/mingw in cirrus.yml
To: luoyonggang@gmail.com
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Peter Lieven <pl@kamp.de>,
 Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <20201013001545.1958-1-luoyonggang@gmail.com>
 <20201013001545.1958-3-luoyonggang@gmail.com>
 <2e501256-001e-a9c4-305c-f178d1b53137@redhat.com>
 <CAE2XoE9datOEr3T391pPmQbD_8bKZgAL_hVoEonojVn-e0Z8PQ@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <77b9c0cd-ddd0-71ef-5480-a61fa2fc039e@redhat.com>
Date: Thu, 5 Nov 2020 15:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9datOEr3T391pPmQbD_8bKZgAL_hVoEonojVn-e0Z8PQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Nov 2020 14:40:56 -0000

On 05.11.20 13:32, 罗勇刚(Yonggang Luo) wrote:
> 
> 
> On Thu, Nov 5, 2020 at 7:43 PM Max Reitz <mreitz@redhat.com 
> <mailto:mreitz@redhat.com>> wrote:
>  >
>  > On 13.10.20 02:15, Yonggang Luo wrote:
>  > > At the begging libnfs are not enabled because of compiling error,
>  > > now it's fixed so enable it
>  > >
>  > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com 
> <mailto:luoyonggang@gmail.com>>
>  > > ---
>  > >   .cirrus.yml | 1 +
>  > >   1 file changed, 1 insertion(+)
>  > >
>  > > diff --git a/.cirrus.yml b/.cirrus.yml
>  > > index f42ccb956a..2c6bf45e6d 100644
>  > > --- a/.cirrus.yml
>  > > +++ b/.cirrus.yml
>  > > @@ -109,6 +109,7 @@ windows_msys2_task:
>  > >             mingw-w64-x86_64-cyrus-sasl \
>  > >             mingw-w64-x86_64-curl \
>  > >             mingw-w64-x86_64-gnutls \
>  > > +          mingw-w64-x86_64-libnfs \
>  > >             "
>  > >           bitsadmin /transfer msys_download /dynamic /download 
> /priority FOREGROUND `
>  > > 
> https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz 
> <https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz> 
> `
>  >
>  > I’d love to test this, unfortunately git.qemu.org 
> <http://git.qemu.org> has some issues now
>  > and so I can’t run Cirrus tests. :/
>  >
>  > I suppose I’ll retry when git.qemu.org <http://git.qemu.org> works again.
>  >
>  > Max
>  >
> Maybe we arealdy switched to gitlab?

I hope not, or it would be really sad that I didn’t notice...

Max


