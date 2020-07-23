Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyd0A-0006yS-2X
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2020 11:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyd08-0006wu-L7
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 11:19:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26840
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyd05-0008AO-Dx
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2020 11:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595517551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=SSmXm6AWoVtLcUQgIKpdWbxCc8XbX9fqAQzTiTxyR40=;
 b=C2j0hfrMBJpDwP+hhl8HC69kRbPNrEqqH2FENs0WdPpf1QrX+qDUQ4BlzT3ioLUC0WE3zc
 VSj0re9j/P59JSCDzO8Agpl6Twld3/CMeURhRsK02AVispdprvLisgAdYxX/iEd6Ija4VI
 pMejSxgDg0z5Geee0Wzq1tEhp2tTPUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-sAyyNNlwO0SWPY9ZJFU6kw-1; Thu, 23 Jul 2020 11:19:09 -0400
X-MC-Unique: sAyyNNlwO0SWPY9ZJFU6kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0071857;
 Thu, 23 Jul 2020 15:19:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E16724CE;
 Thu, 23 Jul 2020 15:19:05 +0000 (UTC)
Subject: Re: [PATCH] target/unicore32: Remove CURSES stuff from the
 Makefile.objs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, QEMU Developers
 <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200723132219.2956-1-thuth@redhat.com>
 <CAFEAcA8=38rqyH==tVeCMz2-MUdJWSSTcS79EAHCBGMuBgarhA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <381e22ef-0eef-cce4-2801-9066559ee30a@redhat.com>
Date: Thu, 23 Jul 2020 17:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=38rqyH==tVeCMz2-MUdJWSSTcS79EAHCBGMuBgarhA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 22:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Thu, 23 Jul 2020 15:19:16 -0000

On 23/07/2020 16.50, Peter Maydell wrote:
> On Thu, 23 Jul 2020 at 14:23, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The dependency on curses has been removed in commit c7a856b42e403e2b
>> ("target/unicore32: Prefer qemu_semihosting_log_out() over curses").
>> So we can remove the related lines in the Makefile now, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Another, unrelated, CONFIG_CURSES oddity:
> hw/input/virtio-input-hid.c has an "#undef CONFIG_CURSES"
> before it includes ui/console.h. But that header file
> doesn't do anything different if CONFIG_CURSES is defined,
> so I think the undef is now useless and can be removed.

There used to be some curses stuff in that header, but it has been
removed more than two years ago (see commit b0766612d16da18). So yes, I
think you're right, that #undef CONFIG_CURSES can be removed now. Care
to send a patch?

 Thomas


