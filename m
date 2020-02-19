Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4QcT-0006aV-5B
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 09:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j4QcR-0006Xt-1T
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 09:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j4QcQ-0004Ho-0A
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 09:46:30 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j4QcP-0004HK-SY
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 09:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582123589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvehIyGQR3ja5S1xooLkob0f2DnC2fXaXKZlp/JUdqI=;
 b=BIeXwkuvYrTmE03qF1oTuSfQ9zbVq9UiqAd6DU4qIleVSIx8POh4Kc2vfbRxZ/ZDiuVIBT
 ICWaORiRprMW8WAMT0YHAJA/vEk9hKlo2uibrq5QFUx7tQ4La8Q8mZyj7cSbtwsFnfLRgN
 cUK37vaxanIBkBOudhcSndd4mEOllSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-vyzavkRHNYau_g_s0J47dQ-1; Wed, 19 Feb 2020 09:46:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 718E113FB;
 Wed, 19 Feb 2020 14:46:15 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B481319756;
 Wed, 19 Feb 2020 14:46:14 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix nonportable use of od --endian
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, andrey.shinkevich@virtuozzo.com,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, mreitz@redhat.com
References: <20200219144103.2919292-1-eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <596f14e4-8412-f984-8bcc-6140a914bb31@redhat.com>
Date: Wed, 19 Feb 2020 08:46:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219144103.2919292-1-eblake@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vyzavkRHNYau_g_s0J47dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 19 Feb 2020 14:46:32 -0000

On 2/19/20 8:41 AM, Eric Blake wrote:
> Tests 261 and 272 fail on RHEL 7 with coreutils 8.22, since od
> --endian was not added until coreutils 8.23.  Fix this by manually
> constructing the final value one byte at a time.
> 
> Fixes: fc8ba423
> Reported-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 8a6366c09daf..b77ef3d22cd1 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -56,6 +56,12 @@ poke_file()
>   # peek_file_le 'test.img' 512 2 => 65534
>   peek_file_le()
>   {
> -    # Wrap in echo $() to strip spaces
> -    echo $(od -j"$2" -N"$3" --endian=little -An -vtu"$3" "$1")
> +    local val=0 shift=0 i
> +
> +    # coreutils' od --endian is not portable, so manually assemble bytes.
> +    for i in $(od -j"$2" -N"$3" -An -v -tu1 "$1"); do
> +        val=$(( val | (i << shift) ))
> +        shift=$((shift + 8))
> +    done
> +    echo $val

Reports large 8-byte values as negative, whereas the pre-patch version 
reported them as positive.  To preserve behavior, we should squash in:

diff --git i/tests/qemu-iotests/common.rc w/tests/qemu-iotests/common.rc
index 8966ad5cde78..a596856d4d8c 100644
--- i/tests/qemu-iotests/common.rc
+++ w/tests/qemu-iotests/common.rc
@@ -63,7 +63,7 @@ peek_file_le()
          val=$(( val | (i << shift) ))
          shift=$((shift + 8))
      done
-    echo $val
+    printf %llu $val
  }

  # peek_file_be 'test.img' 512 2 => 65279
@@ -75,7 +75,7 @@ peek_file_be()
      for i in $(od -j"$2" -N"$3" -An -v -tu1 "$1"); do
          val=$(( (val << 8) | i ))
      done
-    echo $val
+    printf %llu $val
  }

  # peek_file_raw 'test.img' 512 2 => '\xff\xfe'. Do not use if the raw data



-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


