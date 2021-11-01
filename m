Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhYk9-0002Or-5V
	for mharc-qemu-trivial@gnu.org; Mon, 01 Nov 2021 10:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYk6-0002OK-RO
 for qemu-trivial@nongnu.org; Mon, 01 Nov 2021 10:56:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYk4-000726-63
 for qemu-trivial@nongnu.org; Mon, 01 Nov 2021 10:56:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id d3so28510367wrh.8
 for <qemu-trivial@nongnu.org>; Mon, 01 Nov 2021 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3UUr3srpPw4bq4Uad6lcFBBSlzySqZ4qFcW9j/7ed/U=;
 b=tVpLyGDa76PyFNWl0agVqUnFjsZodfkh8KMIRtQaa6Kstp2nzHjslTNWTtYFydx8sO
 m4ATJ7DmuFb5HQ0q2DoZU8UPuowAUmGN5JJ1K6tLCxfNY2INS3g09+Um8Tsbd11TE61W
 huvikSrJv205Bzz6I6sMxAqKfZF1teGKkgrC3vQtKJTpBNvOuKnA9FGS5+o51sl/KO3Z
 SROkGr4gxVGOnjzI3jdVzrtowYEGxWiBDA+GmYu7t0RSDcnTipRh+OF16l3GqP1ZBd6L
 Ww6LaYWhIufxl581E5zhYskAtnV+YDUyUmAyAmdSXUo20rq/QM54ArkYJqYTKegChaJv
 fFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3UUr3srpPw4bq4Uad6lcFBBSlzySqZ4qFcW9j/7ed/U=;
 b=Bpwy3Ukx8BsmVQA6DVhS873pzm1SwkdrzsWhh68YkK3c+kDavVPVOpMxFPI+Z1ui8A
 W7e4iK9q+exZ8u+WqSl88ZL+2RFtGlS1GlXB2c1VmhKW9W4nfbZw72aQ34afVySJRlyF
 jQeymTKtEkFQuxPqDAYVZ8d3O6A6nSwxduH1KkIYzQirXPW2jAli5yEfwFppK5dOUY++
 Pa2KsSRgkh3hARYp0WDI3A2DDApZLNU6RbCAkZe7QOW4GPnzwjzrzU7Ii9KvGydUFAg9
 dsNfzCx/GhCQNMAzugqAewNDTrztktsmKaeJdCDrHmWsj7Ey7iUTRJXsq5U7lL8zXGhs
 Tbaw==
X-Gm-Message-State: AOAM530qOY78ydnKfLfss7mNtxnIU8ePoH6DKirpQiQW7tD9+1Mk/Bc4
 uBt1aGaOiMch0GNik1D2CnwF5n0K5zhVYmg3jDnr/Q==
X-Google-Smtp-Source: ABdhPJzQe/TumGA1L7Y9aSslCYgsY82kQB+aVra8AvdA2dC1bKEIknTeEaXw9BX5GfMIVO4YW590pkS13mP97pLbmuY=
X-Received: by 2002:adf:e984:: with SMTP id h4mr34698014wrm.149.1635778614776; 
 Mon, 01 Nov 2021 07:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211019090344.3054300-1-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:56:43 +0000
Message-ID: <CAFEAcA8CHVfAXFaQwfZrQUfJcD9qQNOYAEt9vvpQVtgwtTf80w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] rSTify contribution-related wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 14:56:59 -0000

On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote=
:
>
> My main motivation was to convert SubmitAPatch[1] based on a chat with
> Peter Maydell and Dan Berrang=C3=A9 on #qemu channel (on OFTC).  But the =
page
> also links to a couple of other contribution-related pages, so I
> converted them too:
>
>   - SubmitAPullRequest: https://wiki.qemu.org/Contribute/SubmitAPullReque=
st
>   - KeySigningParty: https://wiki.qemu.org/KeySigningParty
>   - SpellCheck: https://wiki.qemu.org/Contribute/SpellCheck
>   - TrivialPatches: https://wiki.qemu.org/Contribute/TrivialPatches

I'm not sure that SpellCheck in particular is sufficiently baked
to be in the actual docs. I'd rather just drop the reference to it
from SubmitAPatch. KeySigningParty I'm on the fence about.

-- PMM

