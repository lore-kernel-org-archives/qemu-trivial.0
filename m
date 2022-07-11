Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB039-00036f-Nb
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jul 2022 16:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB037-00035D-Ch
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:30:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB034-0001F5-TY
 for qemu-trivial@nongnu.org; Mon, 11 Jul 2022 16:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLrcIlM+JoKqFwKcxXSLKZFwgjJVx62DbtgUizDbsOw=;
 b=LGjeambyJUM4n/KJS3pUp2tAzNKnQydaeT/MSsA3oxdebhmPaTSL7lB/68mPCw9r5ms1Va
 vdAGZdlAQ5NhenL+FDYOzl5yp82GC4G/Wk+my0MrupGjgkwUHOgqNuGuoqhaGvR+WRvLqn
 IOC3ZXPet0TrNoW0i/KA8AAgcP8vPeY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-dlSamfaAOcO0vVa7lN58Ww-1; Mon, 11 Jul 2022 16:30:23 -0400
X-MC-Unique: dlSamfaAOcO0vVa7lN58Ww-1
Received: by mail-ua1-f71.google.com with SMTP id
 n92-20020ab044e5000000b003832a97a536so679761uan.7
 for <qemu-trivial@nongnu.org>; Mon, 11 Jul 2022 13:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLrcIlM+JoKqFwKcxXSLKZFwgjJVx62DbtgUizDbsOw=;
 b=wUohQdmhlc76G6fasAQhikEQ4V+zYYA8ElLcNvxE3oLF5diSICOuk5Vs0cOsIxVV8t
 a4Ml16bhYYimthmO+dsOnnS5Ly/zCYE2sVsPEKY7o2qDSKDjYR0f1BHx9QHi+xYPTrnZ
 W/7chy7oE7zSTqFbs2IS/Z5XrPTlC+YihFto1yuDU+Ew8DemK6wxo/af3mdOETXsJgAt
 bBEsIlaAKuL6JsoSHUy1J1FCLVP1Cp6QjnFVIMWQKsAP60SgBGmMln4SjicjQba64kzh
 vp30+Je/cK4zTwMEJHcWflWo+TEd7ogDF2tFx60zY6QtzDO7a8pv/SrLXIcNSD/CAL7H
 w8gw==
X-Gm-Message-State: AJIora9XLG6Y5HPE+jjY0dR0aTnRmjNl0ZSXSF4RLrnT3kD/vCWqDpTT
 PHZDenwLdV1osOt6QSSj/WeY/XD5qfMoxuZCjdx14er2oAeLSXBzpYTiHt7vQkkLjxTxWs9GFGF
 mhb0RLeWKJ94Rlv8ALgPq5JLeCSAv2i880g==
X-Received: by 2002:ab0:7706:0:b0:383:589e:1925 with SMTP id
 z6-20020ab07706000000b00383589e1925mr2082936uaq.42.1657571422588; 
 Mon, 11 Jul 2022 13:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uw3exorh1eIDkc79sVUmvJ9ADptNJquZDGRq3t0UYjZ88CIePD468zfBU3GrGML9ISGrXz4rjmHUGSe2RnktQ=
X-Received: by 2002:ab0:7706:0:b0:383:589e:1925 with SMTP id
 z6-20020ab07706000000b00383589e1925mr2082925uaq.42.1657571422317; Mon, 11 Jul
 2022 13:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.61280-1-thuth@redhat.com>
In-Reply-To: <20220711095721.61280-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:30:11 -0400
Message-ID: <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
Subject: Re: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2022 20:30:33 -0000

On Mon, Jul 11, 2022 at 5:57 AM Thomas Huth <thuth@redhat.com> wrote:
>
> 'returns-whitelist' has been renamed to 'command-returns-exceptions' in
> commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  python/qemu/qmp/legacy.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> index 03b5574618..1951754455 100644
> --- a/python/qemu/qmp/legacy.py
> +++ b/python/qemu/qmp/legacy.py
> @@ -50,7 +50,7 @@
>
>  # QMPMessage can be outgoing commands or incoming events/returns.
>  # QMPReturnValue is usually a dict/json object, but due to QAPI's
> -# 'returns-whitelist', it can actually be anything.
> +# 'command-returns-exceptions', it can actually be anything.
>  #
>  # {'return': {}} is a QMPMessage,
>  # {} is the QMPReturnValue.
> --
> 2.31.1
>

May I cajole you to send a MR to
https://gitlab.com/qemu-project/python-qemu-qmp ?

(Sorry for the duplicated effort while the library isn't 100% split
out of the tree yet.)

In this case, for qemu.git:

Reviewed-by: John Snow <jsnow@redhat.com>


