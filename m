Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIREH-0007xf-2H
	for mharc-qemu-trivial@gnu.org; Wed, 16 Sep 2020 02:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIREG-0007xU-H4
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 02:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIREF-0001eM-5o
 for qemu-trivial@nongnu.org; Wed, 16 Sep 2020 02:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600238862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygxeKLcRZsUzt4rH0KKZhESbevDvXYyFlvB5kq6/HzA=;
 b=jJOZi0ffBb1OQzvSFEp7XrOGEFYEMd+MdMF2zOsUoIEMhPQ7bmE3cY6J9b+E2gptLxGenx
 bXJ7T97erAk7g25PG93l6OCVmJYhUW+SdcNu9OC2ZEZck0Ff0hoUKDvX249clO6zJzMpXq
 X4mlZTjK6tA3p8iWAzD5g5QceBRd2Uw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-zBbbNyZdMWy46yk1N3uGsQ-1; Wed, 16 Sep 2020 02:47:39 -0400
X-MC-Unique: zBbbNyZdMWy46yk1N3uGsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B353580732A;
 Wed, 16 Sep 2020 06:47:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC0A1002393;
 Wed, 16 Sep 2020 06:47:32 +0000 (UTC)
Subject: Re: [PATCH] guest agent: Fixes for windows guest agent building on
 msys2/mingw
To: luoyonggang@gmail.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200915163343.1100-1-luoyonggang@gmail.com>
 <06c76888-b2c1-866f-f6f5-78ee9a2bac0c@redhat.com>
 <CAE2XoE8OmSSnzzUivS0jNQu=QEe8c_gPasfksoihdYhO6f4CYg@mail.gmail.com>
 <ba164474-7cb0-1f8f-ef01-2529954a1df9@amsat.org>
 <CAE2XoE_N=XWeg1y74=ohb_p5qiH+rewDtwSGfSwkhHJpA2V06A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3c62fe6-6233-c7d0-e120-074ac976ceb4@redhat.com>
Date: Wed, 16 Sep 2020 08:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_N=XWeg1y74=ohb_p5qiH+rewDtwSGfSwkhHJpA2V06A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 16 Sep 2020 06:47:44 -0000

On 15/09/2020 21.17, 罗勇刚(Yonggang Luo) wrote:

> I agree with that, seems QEMU currently are calling ANSI api all the
> time, better not change that,
>  so globally define -DUNICODE -D_UNICODE is not a option

I agree, -DUNICODE is currently not an option. I'll go with my patch
("qga/commands-win32: Fix problem with redundant protype declaration")
for the time being, until someone found a nicer solution that works.

 Thomas


