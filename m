Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ51L-0006xB-CX
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 04:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQ51I-0006uc-Bi
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 04:41:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQ51F-0002WL-HQ
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 04:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602060111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1009n4Z6caqIe3csLzqMgl87E4wqFUTmrtk/WGx9OU=;
 b=JucLLE1zDev4Ubs+z/hV5gd2+rIVHX1Ll/OuC4DBYt41rlRT0uVKNRbdYoJA2CR2ZXp2ZX
 BYnVddThxdW4UcTGXH7TsjEDXnOUc0jN1nl8v4CF6tVsqt7DDGUSleq7iJ4RDDijXs2+4/
 BeUeQvIGFPoEiVQCmzYuOmWHPE/BtIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-bBbvQbtwNRe0z1ry28jcUQ-1; Wed, 07 Oct 2020 04:41:49 -0400
X-MC-Unique: bBbvQbtwNRe0z1ry28jcUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E93EB186E8C4;
 Wed,  7 Oct 2020 08:41:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 596C119C4F;
 Wed,  7 Oct 2020 08:41:46 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] cirrus: Fixing and speedup the msys2/mingw CI
To: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201007035154.109-1-luoyonggang@gmail.com>
 <20201007035154.109-3-luoyonggang@gmail.com>
 <6b4528dc-918d-ebf4-db27-cbd67fa96c11@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <90b2011a-3e58-1e91-d603-89e099162426@redhat.com>
Date: Wed, 7 Oct 2020 10:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6b4528dc-918d-ebf4-db27-cbd67fa96c11@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Wed, 07 Oct 2020 08:41:58 -0000

On 07/10/2020 10.18, Paolo Bonzini wrote:
[...]
> 
> On top of this, whoever commits this needs to replace the URL with
> something under download.qemu.org, but that's the easy part.

I agree with Daniel - please let's not get go this way again. We've had this
with the various Free-/Net-/OpenBSD images in the past, and then we were
suddenly stuck with a fixed image where most people were not able to change
it anymore. That was very frustrating.

Apart from that, you also have to respect the GPL if you provide binaries
... so you'd need to gather all the sources for that blob, too, and be ready
to provide those in case somebody asks...

Yonggang, could you please try to use the caching mechanism of Cirrus-CI
instead? See https://cirrus-ci.org/guide/writing-tasks/#cache-instruction
... then we're a little bit more independent from downloading the msys2 for
each CI run.

 Thomas


