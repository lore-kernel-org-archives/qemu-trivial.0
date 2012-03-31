Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDxzM-0001Wk-Fv
	for mharc-qemu-trivial@gnu.org; Sat, 31 Mar 2012 09:05:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SDxzJ-0001O1-C0
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 09:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1SDxzH-0002zL-7C
	for qemu-trivial@nongnu.org; Sat, 31 Mar 2012 09:05:00 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:40343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1SDxzC-0002pk-Rv; Sat, 31 Mar 2012 09:04:55 -0400
Received: by iafj26 with SMTP id j26so2612344iaf.4
	for <multiple recipients>; Sat, 31 Mar 2012 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=bh7Bhb7rF6WTm6RosuZqn6c6ZPikD21JgUMxpiGoZIk=;
	b=YFWomfwyLhbVbiPXRJ2G85/BER1GYqXTCXJwgoeWWTFuaI1zCg5dmqQELDs7oeUjLE
	PCcoIcWGZRnFCOY7zGf9cYTPd8gVeIQhofSjwIGScF6+WY90txAo6AVc2OzdVECrOktW
	5syORGZPoE9iMdn1M3DMGhwUeZj0h18MSiAAMir//t5KzvZirmOnkIaWTwzi7sP8Fjjt
	MR7cEodZBy8nG9540RwedQrlzKdnqhVxG3poraAQU0ZSCj0EWEBv10/currcFH46BwFt
	1PWimvUEbv8eaikI8PFxSJS1pYEe9qa2a8Q5EH1iJfymNwu7L0eCRXqSdqXAE4FoxqEI
	K/7A==
Received: by 10.50.222.162 with SMTP id qn2mr1207686igc.65.1333199092410; Sat,
	31 Mar 2012 06:04:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.171.3 with HTTP; Sat, 31 Mar 2012 06:04:32 -0700 (PDT)
In-Reply-To: <1332869033-5558-1-git-send-email-sw@weilnetz.de>
References: <1332869033-5558-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 31 Mar 2012 13:04:32 +0000
Message-ID: <CAAu8pHtfwbRKgGZ3m5fvNZ3W9H6=9wRs2qWJENJ5n8nf7Zw8Pw@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: Peter Maydell <peter.maydell@linaro.org>, Emre Ersin <emre.ersin@gmail.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Andreas Faerber <andreas.faerber@web.de>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Fix conversion from
 lower to upper case with Turkish locale
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
X-List-Received-Date: Sat, 31 Mar 2012 13:05:03 -0000

Thanks, applied.

On Tue, Mar 27, 2012 at 17:23, Stefan Weil <sw@weilnetz.de> wrote:
> Some locale settings let make fail or create wrong results
> because tr '[:lower:]' '[:upper:]' which is used to convert
> from lower to upper case depends on the locale.
>
> With locale tr_TR.UTF-8, lower case 'i' is not converted to 'I'.
> This results in wrong entries in config-host.h like these ones:
>
> =C2=A0#define CONFIG_QEMU_PREFiX "/usr/local"
> =C2=A0#define CONFIG_QEMU_BiNDiR "/usr/local/bin"
>
> This problem was reported by Emre Ersin.
>
> The same problem occurs when configure creates the target specific
> files config-target.mak. They get wrong declarations:
>
> TARGET_CRiS=3Dy
> TARGET_i386=3Dy
> TARGET_MiCROBLAZE=3Dy
> TARGET_MiPS64=3Dy
> TARGET_MiPS=3Dy
> TARGET_UNiCORE32=3Dy
>
> It is sufficient to restrict the conversion to the characters a-z.
>
> Using this explicit range avoids the dependency on the locale
> settings and is also shorter.
>
> v2:
> POSIX says that 'tr a-z' is unspecified outside of the POSIX
> locale, so we must set LC_ALL=3DC to make sure that we are using
> POSIX (hint from Eric Blake, thanks).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =C2=A0configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
6 +++---
> =C2=A0scripts/create_config | =C2=A0 =C2=A06 +++---
> =C2=A0scripts/tracetool =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++--
> =C2=A03 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/configure b/configure
> index 14ef738..39a78dd 100755
> --- a/configure
> +++ b/configure
> @@ -3052,12 +3052,12 @@ if test "$cap_ng" =3D "yes" ; then
> =C2=A0 echo "CONFIG_LIBCAP=3Dy" >> $config_host_mak
> =C2=A0fi
> =C2=A0for card in $audio_card_list; do
> - =C2=A0 =C2=A0def=3DCONFIG_`echo $card | tr '[:lower:]' '[:upper:]'`
> + =C2=A0 =C2=A0def=3DCONFIG_`echo $card | LC_ALL=3DC tr '[a-z]' '[A-Z]'`
> =C2=A0 =C2=A0 echo "$def=3Dy" >> $config_host_mak
> =C2=A0done
> =C2=A0echo "CONFIG_AUDIO_DRIVERS=3D$audio_drv_list" >> $config_host_mak
> =C2=A0for drv in $audio_drv_list; do
> - =C2=A0 =C2=A0def=3DCONFIG_`echo $drv | tr '[:lower:]' '[:upper:]'`
> + =C2=A0 =C2=A0def=3DCONFIG_`echo $drv | LC_ALL=3DC tr '[a-z]' '[A-Z]'`
> =C2=A0 =C2=A0 echo "$def=3Dy" >> $config_host_mak
> =C2=A0 =C2=A0 if test "$drv" =3D "fmod"; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "FMOD_CFLAGS=3D-I$fmod_inc" >> $config_h=
ost_mak
> @@ -3618,7 +3618,7 @@ echo "TARGET_INT_ALIGNMENT=3D$target_int_alignment"=
 >> $config_target_mak
> =C2=A0echo "TARGET_LONG_ALIGNMENT=3D$target_long_alignment" >> $config_ta=
rget_mak
> =C2=A0echo "TARGET_LLONG_ALIGNMENT=3D$target_llong_alignment" >> $config_=
target_mak
> =C2=A0echo "TARGET_ARCH=3D$TARGET_ARCH" >> $config_target_mak
> -target_arch_name=3D"`echo $TARGET_ARCH | tr '[:lower:]' '[:upper:]'`"
> +target_arch_name=3D"`echo $TARGET_ARCH | LC_ALL=3DC tr '[a-z]' '[A-Z]'`"
> =C2=A0echo "TARGET_$target_arch_name=3Dy" >> $config_target_mak
> =C2=A0echo "TARGET_ARCH2=3D$target_arch2" >> $config_target_mak
> =C2=A0# TARGET_BASE_ARCH needs to be defined after TARGET_ARCH
> diff --git a/scripts/create_config b/scripts/create_config
> index 0098e68..ee4737e 100755
> --- a/scripts/create_config
> +++ b/scripts/create_config
> @@ -16,7 +16,7 @@ case $line in
> =C2=A0prefix=3D* | [a-z]*dir=3D*) # directory configuration
> =C2=A0 =C2=A0 name=3D${line%=3D*}
> =C2=A0 =C2=A0 value=3D${line#*=3D}
> - =C2=A0 =C2=A0define_name=3D`echo $name | tr '[:lower:]' '[:upper:]'`
> + =C2=A0 =C2=A0define_name=3D`echo $name | LC_ALL=3DC tr '[a-z]' '[A-Z]'`
> =C2=A0 =C2=A0 eval "define_value=3D\"$value\""
> =C2=A0 =C2=A0 echo "#define CONFIG_QEMU_$define_name \"$define_value\""
> =C2=A0 =C2=A0 # save for the next definitions
> @@ -48,7 +48,7 @@ case $line in
> =C2=A0 =C2=A0 ;;
> =C2=A0ARCH=3D*) # configuration
> =C2=A0 =C2=A0 arch=3D${line#*=3D}
> - =C2=A0 =C2=A0arch_name=3D`echo $arch | tr '[:lower:]' '[:upper:]'`
> + =C2=A0 =C2=A0arch_name=3D`echo $arch | LC_ALL=3DC tr '[a-z]' '[A-Z]'`
> =C2=A0 =C2=A0 echo "#define HOST_$arch_name 1"
> =C2=A0 =C2=A0 ;;
> =C2=A0HOST_USB=3D*)
> @@ -73,7 +73,7 @@ case $line in
> =C2=A0TARGET_BASE_ARCH=3D*) # configuration
> =C2=A0 =C2=A0 target_base_arch=3D${line#*=3D}
> =C2=A0 =C2=A0 if [ "$target_base_arch" !=3D "$target_arch" ]; then
> - =C2=A0 =C2=A0 =C2=A0base_arch_name=3D`echo $target_base_arch | tr '[:lo=
wer:]' '[:upper:]'`
> + =C2=A0 =C2=A0 =C2=A0base_arch_name=3D`echo $target_base_arch | LC_ALL=
=3DC tr '[a-z]' '[A-Z]'`
> =C2=A0 =C2=A0 =C2=A0 echo "#define TARGET_$base_arch_name 1"
> =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 ;;
> diff --git a/scripts/tracetool b/scripts/tracetool
> index 65bd0a1..ddd0ec5 100755
> --- a/scripts/tracetool
> +++ b/scripts/tracetool
> @@ -410,7 +410,7 @@ linetoh_dtrace()
> =C2=A0 =C2=A0 args=3D$(get_args "$1")
> =C2=A0 =C2=A0 argnames=3D$(get_argnames "$1", ",")
>
> - =C2=A0 =C2=A0nameupper=3D`echo $name | tr '[:lower:]' '[:upper:]'`
> + =C2=A0 =C2=A0nameupper=3D`echo $name | LC_ALL=3DC tr '[a-z]' '[A-Z]'`
>
> =C2=A0 =C2=A0 # Define an empty function for the trace event
> =C2=A0 =C2=A0 cat <<EOF
> @@ -539,7 +539,7 @@ convert()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "$1" =3D "h" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D$(get_name "$str")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAME=3D$(echo $name | tr '[:lo=
wer:]' '[:upper:]')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NAME=3D$(echo $name | LC_ALL=
=3DC tr '[a-z]' '[A-Z]')
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "#define TRACE_${NAME}_ENA=
BLED ${enabled}"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 done
> --
> 1.7.9
>
>

