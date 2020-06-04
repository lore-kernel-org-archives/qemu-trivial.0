Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgi7S-0008Qb-Dj
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2020 01:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jgi7Q-0008P5-Qx
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 01:08:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56609
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jgi7O-0006kn-Dg
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 01:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591247320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=AAT/3DkxiA810/k7HKKMHk0gwR78nIGOmSRQWpJzYng=;
 b=ErsdFdhZdn3fvy8ToE4HzXXriyfJh+6SwSvH/jABeI1GuE0BTyLAKgzfxZMaLZZqcLBcZZ
 3TZgL8p4DOgu7XMDiuFLJ+mnpyTkKmgZTKMEWZOZo9mMRSvulWiHZfy7Hl5aXyoyIxcjja
 ToiXxTjvzC8qxcgCh9D5vILjFtR2z04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-xWya0B4uNIyn27PMc2YZeQ-1; Thu, 04 Jun 2020 01:08:36 -0400
X-MC-Unique: xWya0B4uNIyn27PMc2YZeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D66D106BF97;
 Thu,  4 Jun 2020 05:08:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-105.ams2.redhat.com [10.36.112.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D9F78F0F;
 Thu,  4 Jun 2020 05:08:34 +0000 (UTC)
Subject: Re: [PATCH] configure: Disable -Wtautological-type-limit-compare
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200604034513.75103-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <962eb77e-4e9c-e680-645c-2705d9dff7b7@redhat.com>
Date: Thu, 4 Jun 2020 07:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200604034513.75103-1-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:08:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 05:08:45 -0000

On 04/06/2020 05.45, Richard Henderson wrote:
> Clang 10 enables this by default with -Wtype-limit.
> 
> All of the instances flagged by this Werror so far have been
> cases in which we really do want the compiler to optimize away
> the test completely.  Disabling the warning will avoid having
> to add ifdefs to work around this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index f087d2bcd1..693f01327f 100755
> --- a/configure
> +++ b/configure
> @@ -2009,6 +2009,8 @@ gcc_flags="-Wno-missing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
>  gcc_flags="-Wendif-labels -Wno-shift-negative-value $gcc_flags"
>  gcc_flags="-Wno-initializer-overrides -Wexpansion-to-defined $gcc_flags"
>  gcc_flags="-Wno-string-plus-int -Wno-typedef-redefinition $gcc_flags"
> +gcc_flags="$gcc_flags -Wno-tautological-type-limit-compare"
> +
>  # Note that we do not add -Werror to gcc_flags here, because that would
>  # enable it for all configure tests. If a configure test failed due
>  # to -Werror this would just silently disable some features,

Acked-by: Thomas Huth <thuth@redhat.com>


