Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXNkS-0008QJ-BZ
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 23:30:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UXNkM-0008JY-DW
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 23:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1UXNkH-0003PF-MV
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 23:30:22 -0400
Received: from ozlabs.org ([2402:b800:7003:1:1::1]:33974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1UXNk6-00035I-HH; Tue, 30 Apr 2013 23:30:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 461CB2C00CD; Wed,  1 May 2013 13:29:59 +1000 (EST)
Date: Wed, 1 May 2013 13:25:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130501032507.GL20202@truffula.fritz.box>
References: <1367288751-25163-1-git-send-email-aik@ozlabs.ru>
	<517F7368.8010908@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sKHNLc4rGJHGY5Sn"
Content-Disposition: inline
In-Reply-To: <517F7368.8010908@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2402:b800:7003:1:1::1
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] memory: give name every AddressSpace
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
X-List-Received-Date: Wed, 01 May 2013 03:30:26 -0000


--sKHNLc4rGJHGY5Sn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 09:31:52AM +0200, Paolo Bonzini wrote:
> Il 30/04/2013 04:25, Alexey Kardashevskiy ha scritto:
> > The "info mtree" command in QEMU console prints only "memory" and "I/O"
> > address spaces while there are actually a lot more other AddressSpace
> > structs created by PCI and VIO devices. Those devices do not normally
> > have names and therefore not present in "info qtree" output.
> >=20
> > The patch fixes this.
> >=20
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >=20
> > v2:
> > * removed "const" from AddressSpace::name
> > * removed redundand check for name!=3DNULL from mtree_info
> >=20
> > ---
> >  exec.c                |    6 ++----
> >  hw/pci/pci.c          |    3 ++-
> >  hw/ppc/spapr_vio.c    |    2 +-
> >  include/exec/memory.h |    5 +++--
> >  memory.c              |   10 ++++------
> >  5 files changed, 12 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/exec.c b/exec.c
> > index 180a345..0091272 100644
> > --- a/exec.c
> > +++ b/exec.c
> > @@ -1839,13 +1839,11 @@ static void memory_map_init(void)
> >  {
> >      system_memory =3D g_malloc(sizeof(*system_memory));
> >      memory_region_init(system_memory, "system", INT64_MAX);
> > -    address_space_init(&address_space_memory, system_memory);
> > -    address_space_memory.name =3D "memory";
> > +    address_space_init(&address_space_memory, system_memory, "memory");
> > =20
> >      system_io =3D g_malloc(sizeof(*system_io));
> >      memory_region_init(system_io, "io", 65536);
> > -    address_space_init(&address_space_io, system_io);
> > -    address_space_io.name =3D "I/O";
> > +    address_space_init(&address_space_io, system_io, "I/O");
> > =20
> >      memory_listener_register(&core_memory_listener, &address_space_mem=
ory);
> >      memory_listener_register(&io_memory_listener, &address_space_io);
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index fe146dc..0a1acd6 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -823,7 +823,8 @@ static PCIDevice *do_pci_register_device(PCIDevice =
*pci_dev, PCIBus *bus,
> >      memory_region_init_alias(&pci_dev->bus_master_enable_region, "bus =
master",
> >                               pci_dev->iommu, 0, memory_region_size(pci=
_dev->iommu));
> >      memory_region_set_enabled(&pci_dev->bus_master_enable_region, fals=
e);
> > -    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_e=
nable_region);
> > +    address_space_init(&pci_dev->bus_master_as, &pci_dev->bus_master_e=
nable_region,
> > +                       name);
> > =20
> >      pci_dev->devfn =3D devfn;
> >      pstrcpy(pci_dev->name, sizeof(pci_dev->name), name);
> > diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> > index fbcbd6f..fadde20 100644
> > --- a/hw/ppc/spapr_vio.c
> > +++ b/hw/ppc/spapr_vio.c
> > @@ -449,7 +449,7 @@ static int spapr_vio_busdev_init(DeviceState *qdev)
> >      if (pc->rtce_window_size) {
> >          uint32_t liobn =3D SPAPR_VIO_BASE_LIOBN | dev->reg;
> >          dev->tcet =3D spapr_tce_new_table(liobn, pc->rtce_window_size);
> > -        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet));
> > +        address_space_init(&dev->as, spapr_tce_get_iommu(dev->tcet), q=
dev->id);
> >      }
> > =20
> >      return pc->init(dev);
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 99d51b7..907118e 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -177,7 +177,7 @@ struct MemoryRegionPortio {
> >   */
> >  struct AddressSpace {
> >      /* All fields are private. */
> > -    const char *name;
> > +    char *name;
> >      MemoryRegion *root;
> >      struct FlatView *current_map;
> >      int ioeventfd_nb;
> > @@ -839,8 +839,9 @@ void mtree_info(fprintf_function mon_printf, void *=
f);
> >   *
> >   * @as: an uninitialized #AddressSpace
> >   * @root: a #MemoryRegion that routes addesses for the address space
> > + * @name: an address space name
> >   */
> > -void address_space_init(AddressSpace *as, MemoryRegion *root);
> > +void address_space_init(AddressSpace *as, MemoryRegion *root, const ch=
ar *name);
> > =20
> > =20
> >  /**
> > diff --git a/memory.c b/memory.c
> > index cee3e59..b4117a8 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -1002,7 +1002,7 @@ void memory_region_init_iommu(MemoryRegion *mr,
> >      mr->terminates =3D true;  /* then re-forwards */
> >      mr->destructor =3D memory_region_destructor_iommu;
> >      mr->iommu_target_as =3D g_new(AddressSpace, 1);
> > -    address_space_init(mr->iommu_target_as, target);
> > +    address_space_init(mr->iommu_target_as, target, name);
> >  }
> > =20
> >  static uint64_t invalid_read(void *opaque, hwaddr addr,
> > @@ -1599,7 +1599,7 @@ void memory_listener_unregister(MemoryListener *l=
istener)
> >      QTAILQ_REMOVE(&memory_listeners, listener, link);
> >  }
> > =20
> > -void address_space_init(AddressSpace *as, MemoryRegion *root)
> > +void address_space_init(AddressSpace *as, MemoryRegion *root, const ch=
ar *name)
> >  {
> >      memory_region_transaction_begin();
> >      as->root =3D root;
> > @@ -1608,7 +1608,7 @@ void address_space_init(AddressSpace *as, MemoryR=
egion *root)
> >      as->ioeventfd_nb =3D 0;
> >      as->ioeventfds =3D NULL;
> >      QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
> > -    as->name =3D NULL;
> > +    as->name =3D g_strdup(name?name:"anonymous");
> >      address_space_init_dispatch(as);
> >      memory_region_update_pending |=3D root->enabled;
> >      memory_region_transaction_commit();
> > @@ -1623,6 +1623,7 @@ void address_space_destroy(AddressSpace *as)
> >      QTAILQ_REMOVE(&address_spaces, as, address_spaces_link);
> >      address_space_destroy_dispatch(as);
> >      flatview_destroy(as->current_map);
> > +    g_free(as->name);
> >      g_free(as->current_map);
> >      g_free(as->ioeventfds);
> >  }
> > @@ -1749,9 +1750,6 @@ void mtree_info(fprintf_function mon_printf, void=
 *f)
> >      QTAILQ_INIT(&ml_head);
> > =20
> >      QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> > -        if (!as->name) {
> > -            continue;
> > -        }
> >          mon_printf(f, "%s\n", as->name);
> >          mtree_print_mr(mon_printf, f, as->root, 0, 0, &ml_head);
> >      }
> >=20
>=20
> Applied to iommu branch, thanks.

I don't see this patch at git://github.com/bonzini/qemu.git yet.  Did
you need to do something to push it out?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--sKHNLc4rGJHGY5Sn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGAixMACgkQaILKxv3ab8a/7ACfayobPZTKnFPCYFGNvt+dc7ej
zXgAnjIwibpfiCxUaaEhjU4EGoa3yEwP
=LLZ+
-----END PGP SIGNATURE-----

--sKHNLc4rGJHGY5Sn--

