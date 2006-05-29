package net.sourceforge.fenixedu.domain.space;

import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.space.Floor.FloorFactory;
import net.sourceforge.fenixedu.domain.space.Floor.FloorFactoryEditor;

public class FloorInformation extends FloorInformation_Base {
    
    protected FloorInformation(final Floor floor, final FloorFactory floorFactory) {
        super();
        super.setSpace(floor);
        setLevel(floorFactory.getLevel());
    }

    @Override
    public void setSpace(final Space space) {
        throw new DomainException("error.incompatible.space");
    }

    @Override
	public Floor getSpace() {
		return (Floor) super.getSpace();
	}

	public void setSpace(final Floor floor) {
    	throw new DomainException("error.cannot.change.floor");
    }

    public FloorFactoryEditor getSpaceFactoryEditor() {
    	final FloorFactoryEditor floorFactoryEditor = new FloorFactoryEditor();
    	floorFactoryEditor.setSpace(getSpace());
    	floorFactoryEditor.setLevel(getLevel());
    	return floorFactoryEditor;
    }

}
