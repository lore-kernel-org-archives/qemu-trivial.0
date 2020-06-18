Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlmcU-0006I7-2Z
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 00:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlmcS-0006CS-4S
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 00:57:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27383
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlmcP-0007tH-Rx
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 00:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592456260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Np898EeVpvVvEiKw2Rp3dLcHzXexmvQhMwXlOH+B6q4=;
 b=QsuC5ylEyx0Pc2Hw6Lk0jXLy8TIWkpOv80L7E4MNHn38sD+Ob+SD8YD7s6BtDDX06peS45
 GkKVYYLeBCvWaFc6po05G5IR0T+TwdhUKOJIKSqbYYhcCqGjsCyeQWtt8In34QUFDDCgK5
 U0pv0hVnl2K/EFoL+iBBPXPF4yokAkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75--YRWwxlXPeGnRc707FNWRw-1; Thu, 18 Jun 2020 00:57:14 -0400
X-MC-Unique: -YRWwxlXPeGnRc707FNWRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A2E8018A7;
 Thu, 18 Jun 2020 04:57:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5B4A60BF4;
 Thu, 18 Jun 2020 04:57:08 +0000 (UTC)
Subject: Re: [PATCH] hw/audio/gus: Fix registers 32-bit access
To: Allan Peramaki <aperamak@pp1.inet.fi>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200615201757.16868-1-aperamak@pp1.inet.fi>
 <CAFEAcA-eKboVf3uk4iY_A9_uQ=HnGyic4fzbzJhv1gH2V+TMVw@mail.gmail.com>
 <87e628f4-6c0e-c4a2-daba-57cb1e508b77@pp1.inet.fi>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5c118336-0452-5429-1ad9-1e2c982c6d92@redhat.com>
Date: Thu, 18 Jun 2020 06:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87e628f4-6c0e-c4a2-daba-57cb1e508b77@pp1.inet.fi>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 04:57:44 -0000

On 18/06/2020 00.25, Allan Peramaki wrote:
> On 17/06/2020 23:23, Peter Maydell wrote:
>>
>> This patch is quite difficult to read because it mixes some
>> whitespace only changes with some actual changes of
>> behaviour.
> 
> Sorry about that. I had to put some whitespace in the two lines I
> modified because of checkpatch.pl, but then the nearby lines would have
> had inconsistent style if left unmodified.

 Hi Allan!

Makes perfect sense, but for the review, it might have been helpful if
you'd put this information in the commit message.

Anyway, the change looks correct to me, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


