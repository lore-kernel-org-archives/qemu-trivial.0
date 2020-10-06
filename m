Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPlb2-0005SC-Sz
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 07:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPlb1-0005RA-Au
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kPlax-0002dF-Jr
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 07:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601985444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyLUbwhvkDlq29fFKxuIjy+TznmvWkyOMhYFJeafKS4=;
 b=bAqrjJiAWBq40eqxnY1t8Vg4k/BVNEv/oES/wzpagmfPY3ZICEbytxt0ks1t6P6nnOX8Sm
 uyjtQm9EoUVXHRFBnIfhyOj4HOxb9ogbYBYNHgSet+6TV3UvHBjQipxufA7oyFPuZdevqZ
 //BgjUvtd5TYLJHTidCp5gKLrsagBh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-b0yN-dGTMpueOTPKpR1cbg-1; Tue, 06 Oct 2020 07:57:22 -0400
X-MC-Unique: b0yN-dGTMpueOTPKpR1cbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AA31018F7B;
 Tue,  6 Oct 2020 11:57:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE9385576D;
 Tue,  6 Oct 2020 11:57:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36B5911329C1; Tue,  6 Oct 2020 13:57:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <luoyonggang@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  QEMU Trivial
 <qemu-trivial@nongnu.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] scripts: Convert qemu-version.sh to qemu-version.py
In-Reply-To: <CAE2XoE-QZBm=nkimjzTN424LsciD1J3p4DwjDR4uFm2tY07y3w@mail.gmail.com>
 (=?utf-8?B?Iue9l+WLh+WImihZb25nZ2FuZw==?= Luo)"'s message of "Tue, 6 Oct
 2020 19:04:48 +0800")
References: <20201005195129.1507-1-luoyonggang@gmail.com>
 <CAFEAcA8oa7A8f9EjSTnutUKC8tZ98Y_DrSYxdhy22T3y9NHRaQ@mail.gmail.com>
 <CAE2XoE-QZBm=nkimjzTN424LsciD1J3p4DwjDR4uFm2tY07y3w@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 06 Oct 2020 13:57:19 +0200
Message-ID: <87362rsh28.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Oct 2020 11:57:31 -0000

=E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyonggang@gmail.com> writes:

> On Tue, Oct 6, 2020 at 6:33 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>>
>> On Mon, 5 Oct 2020 at 20:51, Yonggang Luo <luoyonggang@gmail.com> wrote:
>> >
>> > The sh script are harder to maintain for compatible different
>> > xsh environment so convert it to python script
>> > Also incorporate the fixes in
>> >
> https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.=
com/
>> >
>> > Testing args length and if not enough, setting pkgversion and version
> to ''
>> >
>> > +#
>> > +# Script for retrieve qemu git version information
>> > +#
>> > +# Author: Yonggang Luo <luoyonggang@gmail.com>
>> > +#
>> > +# This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
>> > +# the COPYING file in the top-level directory.
>>
>> Does this have to be GPL-v2-only ? We strongly prefer
>> v2-or-later...
> Directly copy from other python script, do you have a template for this?

Copy from scripts/qapi-gen.py:

# This work is licensed under the terms of the GNU GPL, version 2 or later.
# See the COPYING file in the top-level directory.


