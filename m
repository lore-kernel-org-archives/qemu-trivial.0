Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZLrt-0004f8-G5
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2011 07:45:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QZLrm-0004aN-Tv
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 07:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QZLrl-0001Vw-JZ
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 07:45:06 -0400
Received: from mail-pw0-f45.google.com ([209.85.160.45]:44038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1QZLri-0001TO-8D; Wed, 22 Jun 2011 07:45:02 -0400
Received: by pwi5 with SMTP id 5so570809pwi.4
	for <multiple recipients>; Wed, 22 Jun 2011 04:45:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.249.37 with SMTP id w37mr85690wfh.448.1308743100665; Wed,
	22 Jun 2011 04:45:00 -0700 (PDT)
Received: by 10.143.79.19 with HTTP; Wed, 22 Jun 2011 04:45:00 -0700 (PDT)
In-Reply-To: <1307117440-18655-1-git-send-email-peter.maydell@linaro.org>
References: <1307117440-18655-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 22 Jun 2011 12:45:00 +0100
Message-ID: <BANLkTinkEncx6FpP2vtBJaGAWD70joQe_w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] configure: Don't create
 symlinks to nonexistent targets
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
X-List-Received-Date: Wed, 22 Jun 2011 11:45:11 -0000

ping?

I didn't cc trivial first time round on the theory that any patch
that makes it to v3 isn't trivial, but since nobody's commented
on this version I guess it's OK...

-- PMM

On 3 June 2011 17:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> When we create the symlinks to source tree files, don't create them
> if the file is not actually present in the source tree; this will
> happen if the file is in a git submodule that wasn't checked out.
>
> This also avoids the odd effect where an in-source-tree configure
> will end up creating the missing file as a symlink to itself.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: remove debug printing
> v2->v3: don't use test constructs marked by POSIX as obsolete,
> as pointed out by Paolo Bonzini
>
> =C2=A0configure | =C2=A0 =C2=A04 +++-
> =C2=A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index a318d37..7f8ad24 100755
> --- a/configure
> +++ b/configure
> @@ -3564,7 +3564,9 @@ for bios_file in $source_path/pc-bios/*.bin $source=
_path/pc-bios/*.rom $source_p
> =C2=A0done
> =C2=A0mkdir -p $DIRS
> =C2=A0for f in $FILES ; do
> - =C2=A0 =C2=A0test -e $f || symlink $source_path/$f $f
> + =C2=A0 =C2=A0if [ -e "$source_path/$f" ] && ! [ -e "$f" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink "$source_path/$f" "$f"
> + =C2=A0 =C2=A0fi
> =C2=A0done
>
> =C2=A0# temporary config to build submodules
> --
> 1.7.1

