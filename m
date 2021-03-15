Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLm2B-0006qM-DJ
	for mharc-qemu-trivial@gnu.org; Mon, 15 Mar 2021 08:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLm29-0006nt-5f
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 08:09:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLm24-0001Yo-UK
 for qemu-trivial@nongnu.org; Mon, 15 Mar 2021 08:09:16 -0400
Received: by mail-ej1-x62c.google.com with SMTP id jt13so65805697ejb.0
 for <qemu-trivial@nongnu.org>; Mon, 15 Mar 2021 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EVI+7dtPeVI4Zc11XL2oUj9+lNG5jQ1jWHycmnb5yFE=;
 b=N8EeBtei8UjH4RKNSFYfpv+MIILlAVf29DJ+uzDtlcPOedv01q+91ctW09DecQ6uzi
 C/oEPpD+2Vy58ouiJekLGtUZJwuXpqQ9fTnVucY5nvPO84GcZC3naqW8LbgZxmUuPkQu
 oVYV8jz3jgU8lRATrpRVrkrI6GeOJL37m8O5ym6CNydCQ1BUGRSKBYGfZroeBIHfYivh
 KVRfnF8cOf3L8S/RqW71/Xmw5Qydy8sCd+w8SnY7agKFVgfdE9ecCYCqLDuom6qfnK0W
 gesUHmvmucGzPlHJJTeXD/H0qF4mzqpI4sjTViZcLKEstyJ96td1vS59n4pRCvGN2o1Y
 y15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EVI+7dtPeVI4Zc11XL2oUj9+lNG5jQ1jWHycmnb5yFE=;
 b=K1us3xIVtPW4CqU4PgnqiC5yofD3jQ48uoLjg8HpbgdHxoe3i8xeTSxSO3uKB+YtSt
 JARtwXQzoPJfo9RJTb/2/b9tVNaQ1AsZm8qeSTTM1yqVSvRvMv0/eU5SQg2dcOJuHR2Q
 7joU+AeJOvUSpGM6eNNJyhDARYObUpmZiPEW4ozoCZ7fw+9FxOvQ/F/wvb6xL8WaH9lC
 GmTKOOkS3RnClTIH07rPhALb6t9mlMid9KpL8qZQAuuNnRxGJiR1ww4si6tXPcwckCtw
 gU33krOcUyLjaIzgvomqgq7oIcEHG6udt2BCAzd/K1fTcIPGl+YlrX3hp5rnbC+2JRno
 DBZw==
X-Gm-Message-State: AOAM5321DCEfs4W5QlaAs2xBRzAj7zRw6saVoeYeJfzRTqbKUWPsAbkr
 klaom/sQGiqfMKkSmjdD4gF5BBxcSPrsmZrUcj6jbA==
X-Google-Smtp-Source: ABdhPJz+/fI7MZBQ0NMMFKZP+hXsIHFUQemiFs+DSAUboezBnounE3NH5ecBSsU3Y9gbDx1BvoOUlLZbpLMdubhkxG4=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr22719900ejz.382.1615810149948; 
 Mon, 15 Mar 2021 05:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210307222625.347268-1-f4bug@amsat.org>
 <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
In-Reply-To: <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 12:08:58 +0000
Message-ID: <CAFEAcA_nMogdN-Q7Z7S=5BY6RWKDq0jnHya5BaoUe+6n8oKWYQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 15 Mar 2021 12:09:18 -0000

On Mon, 15 Mar 2021 at 11:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 07/03/21 23:26, Philippe Mathieu-Daud=C3=A9 wrote:
> > TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
> > MemoryRegion with sysbus_init_mmio(), so we can use the generic
> > sysbus_mmio_get_region() to get the region, no need for a specific
> > pflash_cfi01_get_memory() helper.
> >
> > First replace the few pflash_cfi01_get_memory() uses by
> > sysbus_mmio_get_region(), then remove the now unused helper.
>
> Why is this an improvement?  You're replacing nice and readable code
> with an implementation-dependent function whose second argument is a
> magic number.  The right patch would _add_ more of these helpers, not
> remove them.

I agree that sysbus_mmio_get_region()'s use of arbitrary
integers is unfortunate (we should look at improving that
to use usefully named regions I guess), but I don't see
why pflash_cfi01 should expose its MemoryRegion to users
in a different way to every other sysbus device.

thanks
-- PMM

