Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izfVu-0006K8-HD
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 06:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1izfVs-0006HG-D8
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:40:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1izfVr-000823-Ei
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:40:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51128
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1izfVr-0007yJ-Ac
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 06:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580989202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=RNWvJ/HzHrhXei8cPbN9ZbwLItg++GS1gpF3CH62Rq0=;
 b=diQ7RZ71CeaEJ2XXK1hhvade2BZ+e9H7DUpm2Zn9dtNgBarMshooqGDBpalrs78gHvKrs1
 erSfx3FKKhr+VpMqAYp1RJLSKG9p9tMWUg/zv0BIzjF06uTvKw5V7EsMjiPxofhaJqgCz/
 CN1SzttNKh1MSGOiGVgvAh3obgC52t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-MNkCSEpEPGuUk7N9Rl_4nw-1; Thu, 06 Feb 2020 06:39:59 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4881050904;
 Thu,  6 Feb 2020 11:39:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF3410016DA;
 Thu,  6 Feb 2020 11:39:57 +0000 (UTC)
Subject: Re: [PATCH] hw/bt: Remove empty Kconfig file
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200123064525.6935-1-thuth@redhat.com>
 <CAFEAcA-Tx69KM4dg2GLNhd-Uf=SNrY4oq2+g6twyJMZE_tWx0w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c32bfe2e-2603-8401-7f7e-8ddc5bedec4f@redhat.com>
Date: Thu, 6 Feb 2020 12:39:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Tx69KM4dg2GLNhd-Uf=SNrY4oq2+g6twyJMZE_tWx0w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: MNkCSEpEPGuUk7N9Rl_4nw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Thu, 06 Feb 2020 11:40:05 -0000

On 06/02/2020 12.38, Peter Maydell wrote:
> On Thu, 23 Jan 2020 at 06:46, Thomas Huth <thuth@redhat.com> wrote:
>>
>> While removing the bluetooth code some weeks ago, I had to leave the
>> hw/bt/Kconfig file around. Otherwise some of the builds would have been
>> broken since the generated dependency files tried to include it before
>> they were rebuilt. Meanwhile, all those dependency files should have
>> been updated, so we can remove the empty Kconfig file now, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
> 
> I ran this through my usual buildtests and they were all fine.

Finally! :-)

> Tested-by: Peter Maydell <peter.maydell@linaro.org>

Great, thanks for testing it again, Peter!

 Thomas


