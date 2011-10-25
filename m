Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIniD-0003tO-8p
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2011 16:35:05 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RIni8-0003g5-Va
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 16:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RIni7-000825-Vn
	for qemu-trivial@nongnu.org; Tue, 25 Oct 2011 16:35:00 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:63739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1RIni4-0007zl-R4; Tue, 25 Oct 2011 16:34:57 -0400
Received: by bkat2 with SMTP id t2so1076319bka.4
	for <multiple recipients>; Tue, 25 Oct 2011 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=J8pIj5Z/m0Ges+zheDIkSpf4z7plOsfcoHHtiJSo+j8=;
	b=IZkzeZ1X94+wIQFzODT/kROa5BHy+HS+VgdKXpvf/O8RVQOuo5ywura3bJiGvA+7Ed
	AwqcFUCghjXgxEuGvpIluBXAqGVCcq1TofyelLLLj+qe+8GXpAB1oYxLuGmPe+Igl8cm
	T+i7BsuAJyp7K7MyEmprtOQX2OdLsr9iphAQQ=
Received: by 10.182.217.33 with SMTP id ov1mr4656423obc.26.1319574895181; Tue,
	25 Oct 2011 13:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.5.199 with HTTP; Tue, 25 Oct 2011 13:34:35 -0700 (PDT)
In-Reply-To: <1319519785-6220-1-git-send-email-sw@weilnetz.de>
References: <1319519785-6220-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Tue, 25 Oct 2011 20:34:35 +0000
Message-ID: <CAAu8pHv5cibH340E4qm5MorfPuanUegKbyA4s-T6-XHP1VLJJw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-sparc: Fix use of
	g_new0 / g_free
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Oct 2011 20:35:02 -0000

Thanks, applied.

On Tue, Oct 25, 2011 at 05:16, Stefan Weil <sw@weilnetz.de> wrote:
> g_malloc0 needs g_free instead of free.
> While fixing this, I also replaced g_malloc0 by g_new0
> as was suggested by Stuart Brady.
>
> Cc: Blue Swirl <blauwirbel@gmail.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0target-sparc/cpu_init.c | =C2=A0 =C2=A08 ++++----
> =C2=A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target-sparc/cpu_init.c b/target-sparc/cpu_init.c
> index 08b72a9..6954800 100644
> --- a/target-sparc/cpu_init.c
> +++ b/target-sparc/cpu_init.c
> @@ -74,7 +74,7 @@ static int cpu_sparc_register(CPUSPARCState *env, const=
 char *cpu_model)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> =C2=A0 =C2=A0 }
>
> - =C2=A0 =C2=A0env->def =3D g_malloc0(sizeof(*def));
> + =C2=A0 =C2=A0env->def =3D g_new0(sparc_def_t, 1);
> =C2=A0 =C2=A0 memcpy(env->def, def, sizeof(*def));
> =C2=A0#if defined(CONFIG_USER_ONLY)
> =C2=A0 =C2=A0 if ((env->def->features & CPU_FEATURE_FLOAT)) {
> @@ -100,15 +100,15 @@ static int cpu_sparc_register(CPUSPARCState *env, c=
onst char *cpu_model)
>
> =C2=A0static void cpu_sparc_close(CPUSPARCState *env)
> =C2=A0{
> - =C2=A0 =C2=A0free(env->def);
> - =C2=A0 =C2=A0free(env);
> + =C2=A0 =C2=A0g_free(env->def);
> + =C2=A0 =C2=A0g_free(env);
> =C2=A0}
>
> =C2=A0CPUSPARCState *cpu_sparc_init(const char *cpu_model)
> =C2=A0{
> =C2=A0 =C2=A0 CPUSPARCState *env;
>
> - =C2=A0 =C2=A0env =3D g_malloc0(sizeof(CPUSPARCState));
> + =C2=A0 =C2=A0env =3D g_new0(CPUSPARCState, 1);
> =C2=A0 =C2=A0 cpu_exec_init(env);
>
> =C2=A0 =C2=A0 gen_intermediate_code_init(env);
> --
> 1.7.2.5
>
>
>

