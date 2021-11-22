Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp7HR-0008Jq-AA
	for mharc-qemu-trivial@gnu.org; Mon, 22 Nov 2021 06:14:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7HP-0008Ck-7C
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 06:14:35 -0500
Received: from [2a00:1450:4864:20::42a] (port=37451
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7HN-0003H7-Om
 for qemu-trivial@nongnu.org; Mon, 22 Nov 2021 06:14:34 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b12so31977186wrh.4
 for <qemu-trivial@nongnu.org>; Mon, 22 Nov 2021 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yoFdkWO62twBanTX65W0CEzc9tStIbxUYO8OnbTVzjw=;
 b=nur0CyPscKh+zNJuTK12QgxLqnqL4NhoiVnJIj4jjDy+VteHKqELy1Haw1rYv4nE7U
 ESG1347CidssyvLdluEe3ACafw3zJvcHg0ET1oaq1+Ag7MCldtBsNQT+H8gP161cPB9N
 h7ADPZwDU2go6w4CSvAOH23kQFrsBz8rKrcWDKTdk6lpk6MJzAVgXD+j2Tdv2ykgibV9
 rwCHCoWCuPvr1aONicP6vA1E3XYv4+ONCJ0aZr/yaZbCN+K/vNwf6tosXQ/RSA/jJ0gA
 sg+S8zYtzoLfdxeSskFWr7Be8QuVwde3YANdWWWpX49edHjaq6GS7odXsQPIAzFNJpv5
 0XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yoFdkWO62twBanTX65W0CEzc9tStIbxUYO8OnbTVzjw=;
 b=I+4MMZlEYS1/8rZ7ykGd+unfnkMd4VZ9vTkMyx2W6Lc6pPyoNxhSj/ZYX8y9RizMEM
 k4kRsppZ+EO6FNL4HxUsCiortaaVvfAU4JPW0GB0Seukxadhb2Bs/qoc4o//+UAOUFPo
 XKsquo3gjRLpL+xGbv6cG7ZVV4qHJ1E3aDEOxuAuPnrmBfAZZfi2dQIDa3XJJH6qIO2h
 eiEHDwVokb6Dfw9gum6CtTovBcAwuir9B99cx2Wgw5SZF5Svfaouau1I56yHg3DfTlCf
 wj8mIs153dogUmV14tTCt/c8p7KtLuDT+JRkxTxJfMUVL3g/EUU3yDtHSqncZdhUT0+l
 tPpg==
X-Gm-Message-State: AOAM531WE4ft422zs83qYRibhRWPRPSogFUF3lAhvjfcvMs6akDURGue
 6ZevVy6DMXE/zzVsLnFQxMYXEA5x/YHBbDG2ol979jUVTyHcvQ==
X-Google-Smtp-Source: ABdhPJygWV4EY0Z8ZAB77tXm5TzUm7hjJTXvihZf52gOC/T0TbK1s4z/iJOw/XTCA9mrVvU2G82DrAfyxuve3fCzync=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr37524846wrs.263.1637579672483; 
 Mon, 22 Nov 2021 03:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-4-f4bug@amsat.org>
In-Reply-To: <20211105172127.224462-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 11:14:21 +0000
Message-ID: <CAFEAcA-xNhWGV46SY5K9uChAZWvU44YYgTgXu5wVjKtMq8XTug@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/input/pckbd: Rename i8042_setup_a20_line() and its
 a20 irq argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 22 Nov 2021 11:14:35 -0000

On Fri, 5 Nov 2021 at 17:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> 'a20_out' is an input IRQ, rename it as 'a20_input'.
> i8042_setup_a20_line() doesn't take a Device parameter
> but an ISADevice one. Rename it as i8042_isa_*() to
> make it explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/input/i8042.h | 2 +-
>  hw/i386/pc.c             | 2 +-
>  hw/input/pckbd.c         | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> index 1d90432daef..3534fcc4b43 100644
> --- a/include/hw/input/i8042.h
> +++ b/include/hw/input/i8042.h
> @@ -21,6 +21,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq=
,
>                     MemoryRegion *region, ram_addr_t size,
>                     hwaddr mask);
>  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
> +void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input);
>
>  #endif /* HW_INPUT_I8042_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a821486..06ef74ca22b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1043,7 +1043,7 @@ static void pc_superio_init(ISABus *isa_bus, bool c=
reate_fdctrl, bool no_vmport)
>      port92 =3D isa_create_simple(isa_bus, TYPE_PORT92);
>
>      a20_line =3D qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2=
);
> -    i8042_setup_a20_line(i8042, a20_line[0]);
> +    i8042_isa_setup_a20_line(i8042, a20_line[0]);

I think these days we can directly call
    qdev_connect_gpio_out_named(DEVICE(i8042), I8042_A20_LINE, 0, a20_line[=
0]);
and drop the i8042_setup_a20_line() wrapper entirely,
since the named GPIO lines are a "public" interface to the device.
We only have this i8042_setup_a20_line() because the original
implementation (added in commit 956a3e6bb738) predates gpio lines
and did an assignment into the KBDState struct which needed to
be private to pckbd.c.

>      qdev_connect_gpio_out_named(DEVICE(port92),
>                                  PORT92_A20_LINE, 0, a20_line[1]);

That would then make it consistent with how we're wiring up the
other A20 input source here.

(Some day we should perhaps make the A20 input to the CPU an actual
GPIO input on the CPU device object, so we could wire the I8042_A20_LINE
and PORT92_A20_LINE to it via an OR gate, and drop the intermidate
qemu_irq array and handle_a20_line_change function. But needing
the OR gate makes that a little clunky so I'm not sure it's
really worth the effort.)

-- PMM

