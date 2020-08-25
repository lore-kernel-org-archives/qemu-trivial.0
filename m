Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAReY-0003LZ-79
	for mharc-qemu-trivial@gnu.org; Tue, 25 Aug 2020 01:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAReW-0003Ij-PG
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 01:37:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46611
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAReV-0006dN-92
 for qemu-trivial@nongnu.org; Tue, 25 Aug 2020 01:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598333866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJ1cECmJ/JmCrluwFMDruUt/n/7CSmugjWI/Nst2LPM=;
 b=dKARNXtZUKTTLnyFRUvfQvS3oJkCKw4lsA5dUHmSHTsSnuY3oVcU9XaLp4DdLXSBdc/3Z7
 K3ebCCh0vqceuLr2NSVQmbgqS2BVLWGDmEqTgoAgeijIrE1t0u+bfFGd11/8AKsOpgBcb0
 Vp+DunM5AYSddPWxwlwSPFC+aoYydh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-4WSk8uWUNVCrsT6KoeJpew-1; Tue, 25 Aug 2020 01:37:42 -0400
X-MC-Unique: 4WSk8uWUNVCrsT6KoeJpew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6242980F04E;
 Tue, 25 Aug 2020 05:37:41 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E16105D9CA;
 Tue, 25 Aug 2020 05:37:39 +0000 (UTC)
Subject: Re: [PATCH] configure: default to PIE disabled on Windows platforms
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20200824163109.96938-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8fd5c67c-7bcf-e0d0-bc13-17d0b7e0124d@redhat.com>
Date: Tue, 25 Aug 2020 07:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200824163109.96938-1-berrange@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.25, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Tue, 25 Aug 2020 05:37:49 -0000

On 24/08/2020 18.31, Daniel P. Berrangé wrote:
> If Windows EXE files are built with -pie/-fpie they will fail to
> launch. Historically QEMU defaulted to disabling PIE for Windows,
> but this setting was accidentally lost when the configure summary
> text was removed in
> 
>    commit f9332757898a764d85e19d339ec421236e885b68
>    Author: Paolo Bonzini <pbonzini@redhat.com>
>    Date:   Mon Feb 3 13:28:38 2020 +0100
> 
>      meson: move summary to meson.build
> 
>      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Fixes: f9332757898a764d85e19d339ec421236e885b68
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 67832e3bab..b6f3b6e191 100755
> --- a/configure
> +++ b/configure
> @@ -857,6 +857,7 @@ MINGW32*)
>       audio_drv_list=""
>     fi
>     supported_os="yes"
> +  pie="no"
>   ;;
>   GNU/kFreeBSD)
>     bsd="yes"
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


