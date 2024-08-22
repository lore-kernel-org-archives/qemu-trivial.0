Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sh6hK-0001Tn-9j
	for mharc-qemu-trivial@gnu.org; Thu, 22 Aug 2024 08:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sh6hI-0001RR-Lg
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2024 08:13:48 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sh6hG-00039l-DY
 for qemu-trivial@nongnu.org; Thu, 22 Aug 2024 08:13:48 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-533488ffb03so986183e87.3
 for <qemu-trivial@nongnu.org>; Thu, 22 Aug 2024 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724328824; x=1724933624; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A17X2vXtF3o1S3f4F9GKbovVAlswD6myVLbV8lTu3xA=;
 b=n8+TYbBSAgulwhHuVD3Ps7sA/HThuEOFtALUAd6JTgIiqtCLoNGg0WtWDuMdDzPmk9
 03S4IaYXMnzrbqclg+TBq+t/46B4dippTbXlHPb0g5nOhzaeA2jxhAfho7kZ0hk5mAXp
 W2eaz3xftnWLe9TTDc3va+NAorydrYmLg042NXAc/Q7aerlUIzzqnFSBPlXcj83/n9QH
 lZ2becyI5bWSZr2G1QSRw3JEoNguSgOAD6p1XJCXhOWksOjZrrI/i+WWHrvUuTmIsC7f
 lABUZTNHc2ZdFlts2O53pj0QKhCeBBf/RePE2KxGud3JO1KE5j70APEdNWbT378gNP2Z
 AXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724328824; x=1724933624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A17X2vXtF3o1S3f4F9GKbovVAlswD6myVLbV8lTu3xA=;
 b=jnKE0iCapuYgQLmYz8zN1m3eLmxkFgcSy7ESNpG9Dt+mGvn+fzkkjFdR//JmoWG5R8
 rsP14+Q5QXab7m6zU0uADgY2QNp4Jk4H+0TPL52VgW7SWkyM82+JiaFRevcz/KegS2Vl
 lvwFgkCnxYVIBZ53UamWFcqGuqj+z8yFkvaElfLU9vpZB8Y9Mmcrp66Wn8WaRay6z92a
 wC6VJ+CpMYEF08zbMsQ8N6bK79LRZFnbLxZdyfjkQg4mEu+/iPPBMO+96kzkRlIsgsrs
 ablYf93Gp9YHXVBxUdbBqTE7VroBq4AW+LwxaYgYi3bOvnq+QMwFpJLw+V8XZAa78RJR
 Gk+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF8Pw45IbP3ijVzuYoByM09bfpJgJhEfmeIo3x0680oSJyr6NpVPGqTdoJRDlhId/affcNePaolWIxkJI=@nongnu.org
X-Gm-Message-State: AOJu0YzaNsDAv+3TAXsKpAFVDIMvtYyRpIq1UwZL/jjN2yXEMGrMzHnS
 TvYLxPiKTsxxLXuiOPLceuVzMYvQtRoeBBWEC5vwDw+4joO1aSK6OnRwt0I1+yObgZrqncGS29l
 9xQCkx58+D0dwcXXbZt3L3xE0YjJ7MLMT+3xn1g==
X-Google-Smtp-Source: AGHT+IE1Q++zyAWTNS1+K308AAPTiPcpw+1GIfknE9e0yVp5fYiWiGyFhE/ZKUpRW8UVumWU0fm/4TytveRXJND+aZA=
X-Received: by 2002:a2e:be0e:0:b0:2ef:26f2:d3e2 with SMTP id
 38308e7fff4ca-2f405c7c311mr13821701fa.2.1724328823414; Thu, 22 Aug 2024
 05:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240630165327.38153-1-mjt@tls.msk.ru>
 <20240630165327.38153-16-mjt@tls.msk.ru>
In-Reply-To: <20240630165327.38153-16-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Aug 2024 13:13:32 +0100
Message-ID: <CAFEAcA9KpXLmaUQC6_FiJFX9RkkDSO0a0m7syhHbSokPojv78w@mail.gmail.com>
Subject: Re: [PULL 15/16] vl.c: select_machine(): add selected machine type to
 error message
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Aug 2024 12:13:48 -0000

On Sun, 30 Jun 2024 at 17:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  system/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/system/vl.c b/system/vl.c
> index 92fc29c193..bdd2f6ecf6 100644
> --- a/system/vl.c
> +++ b/system/vl.c
> @@ -1674,7 +1674,7 @@ static MachineClass *select_machine(QDict *qdict, E=
rror **errp)
>          machine_class =3D find_machine(machine_type, machines);
>          qdict_del(qdict, "type");
>          if (!machine_class) {
> -            error_setg(errp, "unsupported machine type");
> +            error_setg(errp, "unsupported machine type: \"%s\"", optarg)=
;
>          }
>      } else {
>          machine_class =3D find_default_machine(machines);

Hi. This patch doesn't do the right thing:

$ ./build/x86/qemu-system-aarch64 -M bang
qemu-system-aarch64: unsupported machine type: "(null)"
Use -machine help to list supported machines

"optarg" is a global, and at the point where we call
select_machine() it isn't valid (we've finished parsing
the options entirely). The thing the error message should
be printing is the local variable "machine_type".

I'll send a patch in a moment.

thanks
-- PMM

