Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1isQlG-0003VG-PP
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jan 2020 07:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1isQlB-0003LJ-Bi
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 07:30:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1isQl7-0008C7-D4
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 07:29:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44729
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1isQl7-0008BW-9I
 for qemu-trivial@nongnu.org; Fri, 17 Jan 2020 07:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579264192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=VBafu5OwPiNavQVJmDrgjZ7TKIqOnk6paaUqerkMzmU=;
 b=OItKtsenNV3lrNfh/GWKCwt8sG7Q/QuOsDIOPF2LQHQ8AqYsfCC0LNOliuGoKw0DEys1Xp
 URroAV4KNtgCdUS+EIgk/4r/foFlx+hC8zKQF5Dk1h1M7UKROPymcTVKBYnxazuvLDtu0u
 O7X/JAIq10XEfhw+ey8VxRZy+1eDPNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-CLE8r4L_OqSbFLWDFtKkLg-1; Fri, 17 Jan 2020 07:29:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2566F195AD2F;
 Fri, 17 Jan 2020 12:29:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-212.ams2.redhat.com [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A5B460C84;
 Fri, 17 Jan 2020 12:29:48 +0000 (UTC)
Subject: Re: [PATCH] tests/vhost-user-bridge: Fix build
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200117122648.137862-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ecc04ad4-8e42-1cbe-927c-96fbfee365a5@redhat.com>
Date: Fri, 17 Jan 2020 13:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200117122648.137862-1-dgilbert@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CLE8r4L_OqSbFLWDFtKkLg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 17 Jan 2020 12:30:01 -0000

On 17/01/2020 13.26, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> vhost-user-bridge isn't actually a test, it's just a helper
> (that should probably move somewhere else) - but the build was
> broken in the qtest move.
> 
> Fixes: 833884f37adc9f125fa2
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/Makefile.include       | 1 +
>  tests/qtest/Makefile.include | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index c6827ce8c2..7833684bac 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -585,6 +585,7 @@ include $(SRC_PATH)/tests/qtest/Makefile.include
>  
>  tests/test-qga$(EXESUF): qemu-ga$(EXESUF)
>  tests/test-qga$(EXESUF): tests/test-qga.o $(qtest-obj-y)
> +tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-obj-y) libvhost-user.a
>  
>  SPEED = quick
>  
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index e6bb4ab28c..eb0f23b108 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -290,7 +290,6 @@ tests/qtest/test-filter-redirector$(EXESUF): tests/qtest/test-filter-redirector.
>  tests/qtest/test-x86-cpuid-compat$(EXESUF): tests/qtest/test-x86-cpuid-compat.o $(qtest-obj-y)
>  tests/qtest/ivshmem-test$(EXESUF): tests/qtest/ivshmem-test.o contrib/ivshmem-server/ivshmem-server.o $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
>  tests/qtest/dbus-vmstate-test$(EXESUF): tests/qtest/dbus-vmstate-test.o tests/qtest/migration-helpers.o tests/qtest/dbus-vmstate1.o $(libqos-pc-obj-y) $(libqos-spapr-obj-y)
> -tests/qtest/vhost-user-bridge$(EXESUF): tests/qtest/vhost-user-bridge.o $(test-util-obj-y) libvhost-user.a
>  tests/qtest/test-arm-mptimer$(EXESUF): tests/qtest/test-arm-mptimer.o
>  tests/qtest/numa-test$(EXESUF): tests/qtest/numa-test.o
>  tests/qtest/vmgenid-test$(EXESUF): tests/qtest/vmgenid-test.o tests/qtest/boot-sector.o tests/qtest/acpi-utils.o
> 

Thanks!

Reviewed-by: Thomas Huth <thuth@redhat.com>

(and cc: qemu-trivial)


