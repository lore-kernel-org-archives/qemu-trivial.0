Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlopb-0004Xb-Ia
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 03:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlopZ-0004XJ-WC
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:19:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51279
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlopY-0005bg-Ha
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592464762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Quxrg89PHXjA0fNJHa987rIDwUxF7/0TPECaDG0w/h0=;
 b=i93XgwdjPCzYXCwFsKX5WEGDgVez7Fb+Fti5HadfhQKE/vGu9PpFJF3cKg7Re81UTgm/yU
 qCNSsoJjiOR/64LmeZpc9zgBrxu9SS3J6uBScT1lJEN0uEP6FVynCBVBZgx6vTJLwXqz+u
 C7gu+5FnIXoOMvXi0qE1xf3ZbtyNFOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-XA_h5Y6uNQyjZE_ACxQGcA-1; Thu, 18 Jun 2020 03:19:20 -0400
X-MC-Unique: XA_h5Y6uNQyjZE_ACxQGcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DDB107ACF2;
 Thu, 18 Jun 2020 07:19:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A24297CAA8;
 Thu, 18 Jun 2020 07:19:18 +0000 (UTC)
Subject: Re: [PATCH] softmmu/vl: Do not recommend to use -M accel=... anymore
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20200618055754.12154-1-thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3972f267-82df-85f8-af60-a242c397ecfc@redhat.com>
Date: Thu, 18 Jun 2020 09:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200618055754.12154-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Thu, 18 Jun 2020 07:19:26 -0000

On 18/06/2020 07.57, Thomas Huth wrote:
> The new -accel parameter can be used multiple times now, so we
> should recommend this new way instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index f669c06ede..e2b2991a5f 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3487,7 +3487,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  if (optarg && strchr(optarg, ':')) {
>                      error_report("Don't use ':' with -accel, "
> -                                 "use -M accel=... for now instead");
> +                                 "use multiple -accel=... options instead");
>                      exit(1);
>                  }

Actually, scratch that. We can now remove that check completely since
the new -accel code does not accept "kvm:tcg" anymore. I'll send a new
patch for removing this check instead.

 Thomas


